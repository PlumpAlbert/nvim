local M = {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart", "LspRestart" },
	event = { "BufReadPre", "BufEnter" },
}

return M
