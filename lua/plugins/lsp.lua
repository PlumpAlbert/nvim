local M = {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{"kevinhwang91/nvim-ufo", dependencies = {"kevinhwang91/promise-async"}}
	}
}

return M
