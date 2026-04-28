vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-jdtls" },
})

local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"

local function get_bundles()
	local bundles = {}

	local java_test = vim.split(vim.fn.glob(mason_packages .. "/java-test/extension/server/*.jar"), "\n")
	if java_test[1] ~= "" then
		vim.list_extend(bundles, java_test)
	end

	local java_debug = vim.split(vim.fn.glob(mason_packages .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"), "\n")
	if java_debug[1] ~= "" then
		vim.list_extend(bundles, java_debug)
	end

	return bundles
end

local jdtls = require("jdtls")
jdtls.extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

vim.lsp.config("jdtls", {
	cmd = {
		"jdtls",
		"--java-executable=" .. vim.fn.expand("~/.sdkman/candidates/java/21.0.9-tem/bin/java"),
		"--jvm-arg=-javaagent:" .. mason_packages .. "/jdtls/lombok.jar",
	},
	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				runtimes = {
					{ name = "JavaSE-17", path = vim.fn.expand("~/.sdkman/candidates/java/17.0.17-tem") },
					{ name = "JavaSE-21", path = vim.fn.expand("~/.sdkman/candidates/java/21.0.9-tem") },
					{ name = "JavaSE-25", path = vim.fn.expand("~/.sdkman/candidates/java/25.0.1-tem") },
				},
			},
			maven = {
				downloadSources = true,
			},
			implementationCodeLens = "all",
			referencesCodeLens = {
				enabled = true,
			},
			format = {
				enabled = true,
			},
		},
		signatureHelp = {
			enabled = true,
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
			filteredTypes = {
				"com.sun.*",
				"io.micrometer.shaded.*",
				"java.awt.*",
				"jdk.*",
				"sun.*",
			},
		},
		contentProvider = {
			preferred = "fernflower",
		},
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},
	on_attach = function(client, bufnr)
		local opts = { buffer = bufnr }

		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		vim.keymap.set(
			"n",
			"<leader>ci",
			function() vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true }) end,
			vim.tbl_extend("force", opts, { desc = "Organize Imports" })
		)
		vim.keymap.set("n", "<leader>cv", jdtls.extract_variable, vim.tbl_extend("force", opts, { desc = "Extract Variable" }))
		vim.keymap.set("v", "<leader>cv", function() jdtls.extract_variable(true) end, vim.tbl_extend("force", opts, { desc = "Extract Variable" }))
		vim.keymap.set("n", "<leader>cC", jdtls.extract_constant, vim.tbl_extend("force", opts, { desc = "Extract Constant" }))
		vim.keymap.set("v", "<leader>cm", function() jdtls.extract_method(true) end, vim.tbl_extend("force", opts, { desc = "Extract Method" }))

		vim.lsp.codelens.enable(true, { bufnr = bufnr })

		jdtls.setup_dap({ hotcodereplace = "auto" })
		require("jdtls.dap").setup_dap_main_class_configs()
	end,
	handlers = {
		-- except QClass diagnostics
		["textDocument/publishDiagnostics"] = function(err, result, ctx)
			if result and result.uri and result.uri:match("/Q%u%w+%.java") then
				result.diagnostics = {}
			end
			vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
		end,
	},
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	init_options = {
		bundles = get_bundles(),
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
	},
})

vim.lsp.enable("jdtls")
