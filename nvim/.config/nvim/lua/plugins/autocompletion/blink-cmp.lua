vim.pack.add({
	{ src = "https://github.com/saghen/blink.compat", version = "v2.5.0" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.10.2" },
	{ src = "https://github.com/moyiz/blink-emoji.nvim" },
	{ src = "https://github.com/onsails/lspkind.nvim" },
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
		accept = { auto_brackets = { enabled = true } },
		list = {
			selection = {
				preselect = false,
				auto_insert = true,
			},
		},
		menu = {
			draw = {
				columns = {
					{ "kind_icon", "label", gap = 1 },
					{ "kind" },
				},
				components = {
					kind_icon = {
						text = function(item)
							local kind = require("lspkind").symbol_map[item.kind] or ""
							return kind .. " "
						end,
						highlight = "CmpItemKind",
					},
					label = {
						text = function(item) return item.label end,
						highlight = "CmpItemAbbr",
					},
					kind = {
						text = function(item) return item.kind end,
						highlight = "CmpItemKind",
					},
				},
			},
		},
		ghost_text = {
			enabled = true,
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
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
		default = { "lsp", "path", "snippets", "buffer", "emoji", "99" },
		providers = {
			emoji = {
				module = "blink-emoji",
				name = "Emoji",
				score_offset = 15, -- Tune by preference
				opts = {
					insert = true, -- Insert emoji (default) or complete its name
					---@type string|table|fun():table
					trigger = function() return { ":" } end,
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
			["99"] = {
				name = "99",
				module = "blink.compat.source",
			},
		},
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
})
