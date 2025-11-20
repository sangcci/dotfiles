vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-jdtls" },
})

local jdtls = require("jdtls")
local jdtls_path = vim.fn.expand("$MASON/packages/jdtls")

-- set jdtls location (-jar)
local launcher_path = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

-- set os config (-configuration)
local SYSTEM = "mac" -- "win", "mac", "linux"
local os_config_path = vim.fn.glob(jdtls_path .. "/config_" .. SYSTEM)

-- set lombok (-javaagent:)
local lombok_path = jdtls_path .. "/lombok.jar"

-- set root dir
local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })

-- bundles (debugger or test)
local java_debug_path = vim.fn.expand("$MASON/packages/java-debug-adapter")
local java_test_path = vim.fn.expand("$MASON/packages/java-test")

local bundles = {
	vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n"))

-- TODO: capabilities (using cmp or blink)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_blink, blink = pcall(require, "blink.cmp")
if has_blink then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

-- Enhanced capabilities for Java
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

------------------------------------------------------------
--- config
------------------------------------------------------------
jdtls.start_or_attach({
	-- cmd
	cmd = {
		-- vim.fn.expand("~/.sdkman/candidates/java/21.*-tem/bin/java"), -- or '/path/to/java17_or_newer/bin/java'
		"java", -- or '/path/to/java17_or_newer/bin/java'

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms512m", -- initial heap size
		"-Xmx2048m", -- maximum heap size
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-javaagent:" .. lombok_path,

		"-jar",
		launcher_path,

		"-configuration",
		os_config_path,

		"-data",
		vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
	},

	-- root dir
	root_dir = root_dir,

	-- init option
	init_options = {
		bundles = bundles,
	},

	-- capabilities
	capabilities = capabilities,

	-- on_attach
	-- Function that will be ran once the language server is attached
	on_attach = function(_, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Diagnostic keymaps
		local opts = { buffer = bufnr, noremap = true, silent = true }

		-- keymaps
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

		-- Custom System.out.println keymap (from original config)
		vim.keymap.set("v", "<leader>l", function()
			local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
			local keys = 'yoSystem.out.println("' .. esc .. 'pA: " + ' .. esc .. "pA);" .. esc
			return vim.fn.feedkeys(keys, "n")
		end, vim.tbl_extend("force", opts, { desc = "System.out.println() for selection" }))

		-- dap
		local jdtls_dap = require("jdtls.dap")

		jdtls_dap.setup_dap()
		jdtls_dap.setup.add_commands()
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

	-- settings
	-- for eclipse jdt.ls
	settings = {
		java = {
			-- Enable downloading archives from eclipse automatically
			eclipse = {
				downloadSource = true,
			},
			-- Enable downloading archives from maven automatically
			maven = {
				downloadSources = true,
			},
			-- Use the fernflower decompiler when using the javap command to decompile byte code back to java code
			contentProvider = {
				preferred = "fernflower",
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
				-- How many classes from a specific package should be imported before automatic imports combine them all into a single import
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			references = {
				includeDecompiledSources = true,
			},
			-- How should different pieces of code be generated?
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				-- When generating hashCode and equals methods use the java 7 objects method
				hashCodeEquals = {
					useJava7Objects = true,
				},
				-- When generating code use code blocks
				useBlocks = true,
			},
			-- enable code lens in the lsp
			referencesCodeLens = {
				enabled = true,
			},
			-- enable inlay hints for parameter names,
			inlayHints = {
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
						default = true,
					},
				},
			},
		},
	},
})
