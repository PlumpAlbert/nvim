-- vim:ft=lua:ts=4:sw=0

require "plugins.lsp.installer"
local lsp = require "plugins.lsp.init"
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
	"emmet_ls",
	"cssls",
	"tailwindcss",
	"html",
	"intelephense",
	"tsserver",
	-- Python
	"pyright",
	-- LaTeX
	"texlab",
	-- Lua
	"sumneko_lua"
}

for _, server in ipairs(servers) do
	local on_attach = lsp.on_attach
	if server == 'html' then
		on_attach = function (client)
			client.server_capabilities.document_formatting = false
			client.server_capabilities.document_range_formatting = false
			lsp.on_attach(client)
		end
	elseif server == 'tsserver' then
		on_attach = function(client, bufnr)
			local ts_utils = require "nvim-lsp-ts-utils"
			client.server_capabilities.document_formatting = false
			ts_utils.setup({
				debug = false,
				disable_commands = false,
				enable_import_on_completion = true,
				import_all_timeout = 3000,
				import_all_priorities = {
					same_file = 1,
					local_file = 2,
					buffer_content = 3,
					buffers = 4
				},
				import_all_scan_buffers = 100,
				import_all_select_source = false,
				update_imports_on_move = true,
				auto_inlay_hints = false,
			})
			ts_utils.setup_client(client)
			local opts = { silent = true }
			local map = vim.api.nvim_buf_set_keymap
			lsp.on_attach(client, bufnr)
			map(bufnr, "n", "<leader>io", ":TSLspOrganize<CR>", opts)
			map(bufnr, "n", "<leader>ia", ":TSLspImportAll<CR>", opts)
			map(bufnr, "n", "<leader>fr", ":TSLspRenameFile<CR>", opts)
		end
	end
	lspconfig[server].setup {
		capabilities = lsp.capabilities,
		on_attach = on_attach,
		settings = require("plugins.lsp.settings"),
		handlers = lsp.handlers,
	}
end

vim.diagnostic.config {
	virtual_text = false,
	float = {
		border = 'rounded'
	}
}
