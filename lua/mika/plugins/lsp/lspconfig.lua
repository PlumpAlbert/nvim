local M = {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart", "LspRestart" },
	event = { "BufReadPre", "BufNewFile" },
}

return M
