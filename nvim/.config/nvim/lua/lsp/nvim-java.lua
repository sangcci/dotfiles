vim.pack.add({
	{
		src = "https://github.com/JavaHello/spring-boot.nvim",
		version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
	},
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/nvim-java/nvim-java",
})

-- NOTE: before use it, ensure installed `wget` in local
require("java").setup()
vim.lsp.config("jdtls", {
	settings = {
		java = {
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
					{
						name = "JavaSE-25",
						path = vim.fn.expand("~/.sdkman/candidates/java/25.0.1-tem"),
					},
				},
			},
		},
	},
})
vim.lsp.enable("jdtls")

local function java_action(action)
	return function()
		vim.lsp.buf.code_action({
			context = { only = { action } },
			apply = true,
		})
	end
end
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		local opts = { buffer = true, silent = true }
		-- TEST
		vim.keymap.set("n", "<leader>tc", "<cmd>JavaTestRunCurrentClass<cr>", vim.tbl_extend("force", opts, { desc = "Test class" }))
		vim.keymap.set("n", "<leader>tm", "<cmd>JavaTestRunCurrentMethod<cr>", vim.tbl_extend("force", opts, { desc = "Test method" }))
		vim.keymap.set("n", "<leader>td", "<cmd>JavaTestDebugCurrentMethod<cr>", vim.tbl_extend("force", opts, { desc = "Debug test" }))
		vim.keymap.set("n", "<leader>tv", "<cmd>JavaTestViewLastReport<cr>", vim.tbl_extend("force", opts, { desc = "Test report" }))
		-- REFACTORING
		vim.keymap.set("n", "<leader>jrf", java_action("refactor.assign.field"), vim.tbl_extend("force", opts, { desc = "Assign to field" }))
		vim.keymap.set("n", "<leader>jrv", java_action("refactor.assign.variable"), vim.tbl_extend("force", opts, { desc = "Assign to variable" }))
		vim.keymap.set("n", "<leader>jrs", java_action("refactor.change.signature"), vim.tbl_extend("force", opts, { desc = "Change signature" }))
		vim.keymap.set({ "n", "v" }, "<leader>jrc", java_action("refactor.extract.constant"), vim.tbl_extend("force", opts, { desc = "Extract constant" }))
		vim.keymap.set({ "n", "v" }, "<leader>jre", java_action("refactor.extract.field"), vim.tbl_extend("force", opts, { desc = "Extract field" }))
		vim.keymap.set("v", "<leader>jrm", java_action("refactor.extract.function"), vim.tbl_extend("force", opts, { desc = "Extract method" }))
		vim.keymap.set("n", "<leader>jri", java_action("refactor.extract.interface"), vim.tbl_extend("force", opts, { desc = "Extract interface" }))
		vim.keymap.set({ "n", "v" }, "<leader>jrx", java_action("refactor.extract.variable"), vim.tbl_extend("force", opts, { desc = "Extract variable" }))
		vim.keymap.set("n", "<leader>jrp", java_action("refactor.introduce.parameter"), vim.tbl_extend("force", opts, { desc = "Introduce parameter" }))
		vim.keymap.set("n", "<leader>jro", java_action("refactor.move"), vim.tbl_extend("force", opts, { desc = "Move" }))
		-- SOURCE GENERATION
		vim.keymap.set("n", "<leader>jsg", java_action("source.generate"), vim.tbl_extend("force", opts, { desc = "Generate menu" }))
		vim.keymap.set("n", "<leader>jsa", java_action("source.generate.accessors"), vim.tbl_extend("force", opts, { desc = "Generate getters/setters" }))
		vim.keymap.set("n", "<leader>jsc", java_action("source.generate.constructors"), vim.tbl_extend("force", opts, { desc = "Generate constructor" }))
		vim.keymap.set("n", "<leader>jsd", java_action("source.generate.delegateMethods"), vim.tbl_extend("force", opts, { desc = "Generate delegates" }))
		vim.keymap.set("n", "<leader>jsf", java_action("source.generate.finalModifiers"), vim.tbl_extend("force", opts, { desc = "Add final modifiers" }))
		vim.keymap.set("n", "<leader>jsh", java_action("source.generate.hashCodeEquals"), vim.tbl_extend("force", opts, { desc = "Generate hashCode/equals" }))
		vim.keymap.set("n", "<leader>jst", java_action("source.generate.toString"), vim.tbl_extend("force", opts, { desc = "Generate toString" }))
		-- SOURCE ACTIONS
		vim.keymap.set("n", "<leader>ji", java_action("source.organizeImports"), vim.tbl_extend("force", opts, { desc = "Organize imports" }))
		vim.keymap.set("n", "<leader>jo", java_action("source.overrideMethods"), vim.tbl_extend("force", opts, { desc = "Override methods" }))
		vim.keymap.set("n", "<leader>jm", java_action("source.sortMembers"), vim.tbl_extend("force", opts, { desc = "Sort members" }))
		-- Quick assist (general suggestions)
		vim.keymap.set("n", "<leader>ja", java_action("quickassist"), vim.tbl_extend("force", opts, { desc = "Quick assist" }))
	end,
})
