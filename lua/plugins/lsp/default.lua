-- vim:ft=lua:ts=4:sw=0
local LSP = require "plugins.lsp.init"
local lspconfig = require "lspconfig"

local servers = {
	-- Ansible
	"ansiblels",
	-- C,CPP
	"cmake",
	"clangd",
	-- Docker
	"dockerls",
	-- Web dev
	"cssls",
	"tailwindcss",
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

lspconfig.html.setup {
	on_attach = LSP.on_attach,
	capabilities = LSP.capabilities,
	filetypes = {
		'html', 'blade'
	}
}
