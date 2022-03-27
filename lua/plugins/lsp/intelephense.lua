local LSP = require "plugins.lsp.init"
local lspconfig = require "lspconfig"

lspconfig.intelephense.setup {
	capabilities = LSP.capabilities,
	on_attach = function(client, ...)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		LSP.on_attach(client, ...)
	end,
	filetypes = {
		'php',
		'blade'
	}
}
