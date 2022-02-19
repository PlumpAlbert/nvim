-- vim:ft=lua:ts=4:sw=0
local LSP = require "plugins.lsp.init"
local lspconfig = require "lspconfig"
local ts_utils = require "nvim-lsp-ts-utils"

lspconfig.tsserver.setup {
	init_options = ts_utils.init_options,
	capabilities = LSP.capabilities,
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false

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
		})

		ts_utils.setup_client(client)

		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ia", ":TSLspImportAll<CR>", { silent = true })
		LSP.on_attach(bufnr)
	end
}
