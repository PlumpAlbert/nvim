local LSP = require "plugins.lsp.init"
local lspconfig = require "lspconfig"

lspconfig.intelephense.setup {
	filetypes = {
		'php',
		'blade'
	}
}
