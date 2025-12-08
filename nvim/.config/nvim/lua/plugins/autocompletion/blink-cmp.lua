vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/moyiz/blink-emoji.nvim" },
})

-- Enable Blink Completion
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
	root_markers = { ".git" },
})

require("blink.cmp").setup({
	-- :help blink-cmp-config-keymap
	keymap = { preset = "enter" },

	-- :help blink-cmp-config-appearance
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	completion = {
		menu = {
			border = "rounded",
		},
		ghost_text = {
			enabled = true,
		},
		documentation = {
			auto_show = true,
		},
	},

	-- NOTE: you have to use the signature only open the function bracket. not enter the auto completion.
	signature = {
		enabled = true,
		trigger = {
			show_on_insert = true,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer", "emoji" },
		providers = {
			emoji = {
				module = "blink-emoji",
				name = "Emoji",
				score_offset = 15, -- Tune by preference
				opts = {
					insert = true, -- Insert emoji (default) or complete its name
					---@type string|table|fun():table
					trigger = function()
						return { ":" }
					end,
				},
				should_show_items = function()
					return vim.tbl_contains(
						-- Enable emoji completion only for git commits and markdown.
						-- By default, enabled for all file-types.
						{ "gitcommit", "markdown" },
						vim.o.filetype
					)
				end,
			},
		},
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
})
