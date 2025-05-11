return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufEnter' },
	cmd = { 'ConformInfo' },
	keys = {
		{
			'<leader>lf',
			function()
				require('conform').format { async = true }
			end,
			desc = '[LSP] Format document',
		},
	},
	config = function()
		require('conform').setup {
			log_level = vim.log.levels.DEBUG,
			notify_on_error = true,
			default_format_opts = {
				lsp_format = 'fallback',
				stop_after_first = true,
				timeout_ms = 5000,
			},
			format_after_save = {},
			formatters_by_ft = {
				lua = { 'stylua' },
				json = { 'prettier', 'prettierd' },
				jsonc = { 'prettier', 'prettierd' },
			},
		}
	end,
}
