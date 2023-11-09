require("options")
require("config/keymaps")
require("config/lazy")
require("colorscheme")

if vim.g.neovide then
	require("config.neovide")
end
