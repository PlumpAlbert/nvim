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
	"html",
	-- Python
	"pyright",
	-- LaTeX
	"texlab",
}

for _, server in ipairs(servers) do
	local on_attach = nil
	if server == 'html' then
		on_attach = function (client)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
			LSP.on_attach(client)
		end
	end
	lspconfig[server].setup {
		on_attach = on_attach or LSP.on_attach,
		capabilities = LSP.capabilities,
	}
end
