-- vim:ft=lua:ts=4:sw=0
local LSP = require "plugins.lsp.init"
local lspconfig = require "lspconfig"

local servers = {
	-- C,CPP
	"cmake",
	"clangd",
	-- Docker
	"dockerls",
	-- Web dev
	"html",
	"cssls",
	"tailwindcss",
	"emmet_ls",
	-- PHP
	"intelephense",
	-- Python
	"pyright",
	-- LaTeX
	"texlab",
}

for _, server in ipairs(servers) do
	lspconfig[server].setup {
		on_attach = LSP.on_attach,
		capabilities = LSP.capabilities,
	}
end
