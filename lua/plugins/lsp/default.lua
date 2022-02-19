-- vim:ft=lua:ts=4:sw=0
local LSP = require "plugins.lsp.init"
local lspconfig = require "lspconfig"

local servers = {
	"html",
	"cssls",
	"emmet_ls",
	"intelephense",
	"pyright",
	"texlab",
	"cmake",
	"clangd"
}

for _, server in ipairs(servers) do
	lspconfig[server].setup {
		on_attach = LSP.on_attach,
		capabilities = LSP.capabilities,
	}
end
