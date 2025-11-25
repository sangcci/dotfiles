vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-jdtls" },
})

local function java_keymaps(bufnr, jdtls, gradle_telescope)
	local opts = { buffer = bufnr, noremap = true, silent = true }

	-- Organize imports
	vim.keymap.set("n", "<leader>ji", function()
		jdtls.organize_imports()
	end, vim.tbl_extend("force", opts, { desc = "Organize imports" }))

	-- Extract variable
	vim.keymap.set({ "n", "v" }, "<leader>jv", function()
		jdtls.extract_variable()
	end, vim.tbl_extend("force", opts, { desc = "Extract variable" }))

	-- Extract constant
	vim.keymap.set({ "n", "v" }, "<leader>jc", function()
		jdtls.extract_constant()
	end, vim.tbl_extend("force", opts, { desc = "Extract constant" }))

	-- Extract method
	vim.keymap.set("v", "<leader>jm", function()
		jdtls.extract_method()
	end, vim.tbl_extend("force", opts, { desc = "Extract method" }))

	-- Test class
	vim.keymap.set("n", "<leader>jt", function()
		jdtls.test_class()
	end, vim.tbl_extend("force", opts, { desc = "Test class" }))

	-- Test nearest method
	vim.keymap.set("n", "<leader>jtm", function()
		jdtls.test_nearest_method()
	end, vim.tbl_extend("force", opts, { desc = "Test nearest method" }))

	-- gradle tasks finder
	vim.keymap.set("n", "<leader>jg", function()
		gradle_telescope.telescope_find_gradle_tasks()
	end, { desc = "[G]radle Tasks" })

	-- Refresh cache if build.gradle changes
	vim.keymap.set("n", "<leader>jgr", function()
		gradle_telescope.refresh_cache()
	end, { desc = "[R]efresh Gradle Cache" })
end

------------------------------------------------------------
--- config
------------------------------------------------------------
vim.lsp.config("jdtls", {
	-- cmd
	cmd = {
		-- lsp jvm version
		vim.fn.expand("~/.sdkman/candidates/java/21.*-tem/bin/java"),
		-- "java", -- using local default jvm
		-- "/path/to/java17_or_newer/bin/java",

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g", -- initial heap size
		"-Xmx4g", -- maximum heap size
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- lombok agent
		"-javaagent:"
			.. vim.fn.expand("$MASON/packages/jdtls")
			.. "/lombok.jar",

		-- eclipse jdt.ls launcher
		"-jar",
		vim.fn.glob(vim.fn.expand("$MASON/packages/jdtls") .. "/plugins/org.eclipse.equinox.launcher_*.jar"),

		-- os config
		"-configuration",
		vim.fn.glob(vim.fn.expand("$MASON/packages/jdtls") .. "/config_" .. "mac"), -- "win", "mac", "linux"

		-- data
		"-data",
		vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
	},

	root_dir = require("jdtls").setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

	capabilities = require("blink.cmp").get_lsp_capabilities(),

	init_options = {
		bundles = (function()
			-- bundles (debugger or test path)
			local java_debug_path = vim.fn.expand("$MASON/packages/java-debug-adapter")
			local java_test_path = vim.fn.expand("$MASON/packages/java-test")

			local bundles = {
				vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
			}
			vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n"))
			return bundles
		end)(),
	},

	on_attach = function(_, bufnr)
		-- gradle-telescope setup
		local gradle_telescope = require("gradle-telescope")
		gradle_telescope.setup()

		-- keymap
		local jdtls = require("jdtls")
		java_keymaps(bufnr, jdtls, gradle_telescope)

		-- setup dap
		local jdtls_dap = require("jdtls.dap")

		jdtls_dap.setup_dap()
		jdtls_dap.setup_dap_main_class_configs()

		-- codelens
		vim.lsp.codelens.refresh()

		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.java" },
			callback = function()
				local _, _ = pcall(vim.lsp.codelens.refresh)
			end,
		})
	end,

	settings = {
		java = {
			eclipse = {
				downloadSource = true, -- Enable downloading archives from eclipse automatically
			},
			maven = {
				downloadSources = true, -- Enable downloading archives from maven automatically
			},
			contentProvider = {
				preferred = "fernflower", -- Use the fernflower decompiler when using the javap command to decompile byte code back to java code
			},
			signatureHelp = {
				enabled = true,
				description = {
					enabled = true,
				},
			},
			saveActions = {
				organizeImports = true,
			},
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
			},
			sources = {
				organizeImports = { -- How many classes from a specific package should be imported before automatic imports combine them all into a single import

					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			references = {
				includeDecompiledSources = true,
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				hashCodeEquals = {
					useJava7Objects = true,
				},
				useBlocks = true, -- When generating code use code blocks
			},
			referencesCodeLens = { -- enable code lens in the lsp
				enabled = true,
			},
			inlayHints = { -- enable inlay hints for parameter names,
				parameterNames = {
					enabled = "all",
				},
			},
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = vim.fn.expand("~/.sdkman/candidates/java/17.0.17-tem"),
					},
					{
						name = "JavaSE-21",
						path = vim.fn.expand("~/.sdkman/candidates/java/21.0.9-tem"),
					},
				},
			},
		},
	},
})
vim.lsp.enable("jdtls")
