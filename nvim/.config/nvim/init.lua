-- NOTE: vim.pack package manager path recognition issue
-- if nvim was installed by another way such as `bob`, we have to set the right path so that they can recognize.
-- issue: https://github.com/neovim/neovim/issues/36529
-- doc: https://github.com/neovim/neovim/blob/8bce9342d101eed4bb16fe03d36e7f89bac991ab/runtime/doc/pack.txt#L214-L216
-- vim.o.packpath = vim.fn.stdpath("config") .. "," .. vim.o.packpath .. "," .. vim.fn.expand("~/.local/share/nvim/site")

local profile = require("profiles")

if profile.current == "vscode" then
	require("vsc_config.options")
	require("vsc_config.keymaps")
elseif profile.current == "full" then
	require("profiles.full")
else
	require("profiles.lite")
end
