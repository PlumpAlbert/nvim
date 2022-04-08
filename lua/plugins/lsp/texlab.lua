local LSP = require "plugins.lsp.init"
local lspconfig = require "lspconfig"

lspconfig.texlab.setup {
	on_attach = LSP.on_attach,
	capabilities = LSP.capabilities,
	settings = {
		texlab = {
			auxDirectory = './aux',
			bibtexFormatter = 'latexindent',
			latexFormatter = 'latexindent',
			formatterLineLength = 80,
			build = {
				args = {
					'-pdf',
					"-interaction=nonstopmode",
					"-synctex=1",
					"-outdir=.",
					"%f"
				},
				onSave = false,
			},
		}
	}
}
