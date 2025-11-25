local M = {}

local function get_pack_path()
	return vim.fs.joinpath(vim.fn.stdpath("data"), "site", "pack", "core", "opt") -- vim.pack path stored plugins
end

function M.build_plugin(plugin_name, build_cmd)
	local plugin_path = vim.fs.joinpath(get_pack_path(), plugin_name)

	if vim.fn.isdirectory(plugin_path) == 0 then
		vim.notify(string.format("Plugin '%s' not found at %s", plugin_name, plugin_path), vim.log.levels.WARN)
		return false
	end

	local build_marker = vim.fs.joinpath(plugin_path, ".built")

	-- Check if already built
	if vim.fn.filereadable(build_marker) == 1 then
		return true -- Already built, skip
	end

	vim.notify(string.format("Building %s...", plugin_name), vim.log.levels.INFO)

	local result = vim.fn.system(string.format("cd %s && %s", plugin_path, build_cmd))

	if vim.v.shell_error == 0 then
		-- Create marker file to indicate successful build
		vim.fn.writefile({ os.date() }, build_marker)
		vim.notify(string.format("✓ Built %s", plugin_name), vim.log.levels.INFO)
		return true
	else
		vim.notify(string.format("✗ Failed to build %s\n%s", plugin_name, result), vim.log.levels.ERROR)
		return false
	end
end

return M
