return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function()
			local lsp = require'config.servers.lsp'

			vim.list_extend(lsp.install, {'dockerls', 'docker_compose_language_service'})
			lsp.options = vim.tbl_extend('force', lsp.options, {
				docker_compose_language_service = {
					filetypes = {'yaml.docker'},
				}
			})
		end,
	},
}
