local LSP = require "plugins.lsp.init"
local lspconfig = require "lspconfig"

lspconfig.texlab.setup {
	on_attach = LSP.on_attach,
	capabilities = LSP.capabilities,
	settings = {
		latex = {
			build = {
				onSave = false
			}
		}
	}
}
