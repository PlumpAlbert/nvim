return {
	-- folke/lazydev.nvim
	{
		'folke/lazydev.nvim',
		ft = 'lua',
		opts = {
			library = {
				{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
			},
		},
	},
	-- Bekaboo/dropbar.nvim
	{
		'Bekaboo/dropbar.nvim',
		event = { 'BufReadPre' },
		keys = function()
			local api = require 'dropbar.api'

			return {
				{
					'<leader>;',
					api.pick,
					desc = 'Pick symbols in winbar',
				},
				{
					'[;',
					api.goto_context_start,
					desc = 'Go to context start',
				},
				{
					'];',
					api.select_next_context,
					desc = 'Select next context',
				},
			}
		end,
	},
	-- MagicDuck/grug-far.nvim
	{
		'MagicDuck/grug-far.nvim',
		config = true,
		cmd = { 'GrugFar', 'GrugFarWithin' },
		keys = {
			{ '<leader>fr', ':GrugFar<CR>', desc = 'Find & Replace' },
			{ '<leader>fr', ':GrugFarWithin<CR>', desc = 'Find & Replace', mode = { 's' } },
		},
	},
}
