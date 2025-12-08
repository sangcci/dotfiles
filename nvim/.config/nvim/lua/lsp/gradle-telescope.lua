-- Telescope stuff
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")

-- Async stuff
local Job = require("plenary.job")

local M = {}

-- Cache for tasks and dependencies
M.tasks = {}
local dependency_cache = {}

-- File watcher state
local file_watchers = {}

-- Parse gradle tasks output
local function parse_gradle_tasks(output)
	local tasks = {}
	local in_tasks_section = false

	for line in output:gmatch("[^\r\n]+") do
		-- Start capturing after separator line
		if line:match("^%-+$") then
			in_tasks_section = true
		elseif in_tasks_section then
			-- Match task lines: "taskName - description"
			local task_name = line:match("^([%w:]+)%s*%-")
			if task_name then
				local description = line:match("^[%w:]+%s*%-%s*(.+)$") or ""
				table.insert(tasks, {
					name = task_name,
					description = description,
					display = string.format("%-40s %s", task_name, description),
				})
			end
		end
	end

	return tasks
end

-- Error handler
local function on_stderr(_, data)
	if data then
		vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR)
	end
end

-- Async cache gradle tasks
local function async_cache_gradle_tasks()
	Job:new({
		command = "./gradlew",
		args = { "tasks", "--all", "--no-rebuild", "--console", "plain" },
		on_exit = function(j, return_val)
			if return_val == 0 then
				local result = table.concat(j:result(), "\n")
				M.tasks = parse_gradle_tasks(result)
				vim.schedule(function()
					vim.notify("Gradle: Cached " .. #M.tasks .. " tasks!", vim.log.levels.INFO)
				end)
			end
		end,
		on_stderr = on_stderr,
	}):start()
end

-- Spawn gradle daemon
local function async_spawn_gradle_daemon()
	Job:new({
		command = "./gradlew",
		args = { "--daemon" },
		on_exit = function(j, return_val)
			if return_val == 0 then
				vim.schedule(function()
					vim.notify("Gradle daemon started", vim.log.levels.INFO)
				end)
				async_cache_gradle_tasks()
			end
		end,
		on_stderr = on_stderr,
	}):start()
end

-- Check and prepare gradle daemon
local function async_prepare_gradle_daemon()
	Job:new({
		command = "./gradlew",
		args = { "--status" },
		on_exit = function(j, return_val)
			local result = table.concat(j:result(), "\n")
			if string.match(result, "No Gradle daemons are running") then
				vim.schedule(function()
					vim.notify("Starting Gradle daemon...", vim.log.levels.INFO)
				end)
				async_spawn_gradle_daemon()
			else
				async_cache_gradle_tasks()
			end
		end,
		on_stderr = on_stderr,
	}):start()
end

-- Get task dependencies (with caching)
local function get_task_dependencies(task_name, callback)
	-- Check cache first
	if dependency_cache[task_name] then
		callback(dependency_cache[task_name])
		return
	end

	-- Show loading state
	callback("Loading dependencies...")

	-- Fetch dependencies asynchronously
	Job:new({
		command = "./gradlew",
		args = { task_name, "--dry-run" },
		on_exit = function(j, return_val)
			local result = table.concat(j:result(), "\n")

			-- Cache the result
			dependency_cache[task_name] = result

			vim.schedule(function()
				callback(result)
			end)
		end,
		on_stderr = on_stderr,
	}):start()
end

-- Main telescope picker
M.telescope_find_gradle_tasks = function(opts)
	-- Check if gradlew exists
	local path_to_gradlew = vim.fn.getcwd() .. "/gradlew"
	local is_gradlew_there = vim.fn.filereadable(path_to_gradlew)
	if is_gradlew_there == 0 then
		vim.notify("Couldn't find gradle binary", vim.log.levels.ERROR)
		return
	end

	-- Check if tasks are cached
	if #M.tasks == 0 then
		vim.notify("Tasks not cached yet. Use :GradleInit or wait for initialization.", vim.log.levels.WARN)
		return
	end

	opts = opts or {}

	pickers
		.new(opts, {
			prompt_title = "Gradle Tasks",
			finder = finders.new_table({
				results = M.tasks,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.display,
						ordinal = entry.name .. " " .. entry.description,
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			previewer = previewers.new_buffer_previewer({
				title = "Task Dependencies",
				define_preview = function(self, entry)
					local task = entry.value
					local lines = {
						"Task: " .. task.name,
						"Description: " .. task.description,
						"",
						"Loading dependencies...",
					}
					vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)

					-- Get dependencies (cached or fetch)
					get_task_dependencies(task.name, function(result)
						local preview_lines = {
							"Task: " .. task.name,
							"Description: " .. task.description,
							"",
							"Task Dependency Tree:",
							"--------------------",
						}

						for line in result:gmatch("[^\r\n]+") do
							if line ~= "" then
								table.insert(preview_lines, line)
							end
						end

						vim.schedule(function()
							if vim.api.nvim_buf_is_valid(self.state.bufnr) then
								vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, preview_lines)
							end
						end)
					end)
				end,
			}),
			attach_mappings = function(prompt_bufnr, map)
				-- Just close on enter (view only)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
				end)
				return true
			end,
		})
		:find()
end

-- Refresh cache manually
M.refresh_cache = function()
	dependency_cache = {}
	async_cache_gradle_tasks()
end

-- Setup file watchers for build.gradle files
local function setup_file_watchers()
	-- Stop existing watchers
	for _, watcher in ipairs(file_watchers) do
		if watcher then
			watcher:stop()
		end
	end
	file_watchers = {}

	-- Find all build.gradle and build.gradle.kts files
	local gradle_files = vim.fn.globpath(vim.fn.getcwd(), "**/build.gradle*", false, true)

	for _, file in ipairs(gradle_files) do
		local watcher = vim.loop.new_fs_event()
		if watcher then
			watcher:start(
				file,
				{},
				vim.schedule_wrap(function(err, filename, events)
					if err then
						return
					end
					-- Debounce: refresh only if not already refreshing
					if events.change then
						vim.notify(
							"Detected changes in " .. vim.fn.fnamemodify(file, ":t") .. ", refreshing cache...",
							vim.log.levels.INFO
						)
						M.refresh_cache()
					end
				end)
			)
			table.insert(file_watchers, watcher)
		end
	end

	if #file_watchers > 0 then
		vim.notify("Watching " .. #file_watchers .. " Gradle file(s) for changes", vim.log.levels.INFO)
	end
end

-- Stop all file watchers
M.stop_watchers = function()
	for _, watcher in ipairs(file_watchers) do
		if watcher then
			watcher:stop()
		end
	end
	file_watchers = {}
	vim.notify("Stopped watching Gradle files", vim.log.levels.INFO)
end

-- Initialize (start daemon and cache tasks)
M.init = function()
	async_prepare_gradle_daemon()
end

-- Setup function
M.setup = function(opts)
	opts = opts or {}

	-- Enable auto-refresh by default, can be disabled
	local enable_auto_refresh = opts.enable_auto_refresh
	if enable_auto_refresh == nil then
		enable_auto_refresh = true
	end

	async_prepare_gradle_daemon()

	-- Setup file watchers if enabled
	if enable_auto_refresh then
		-- Wait a bit for daemon to start, then setup watchers
		vim.defer_fn(function()
			setup_file_watchers()
		end, 2000)
	end
end

return M
