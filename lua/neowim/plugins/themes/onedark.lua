return {
	'navarasu/onedark.nvim',
	enabled = false,
	priority = 1000,
	config = function()
		require('onedark').setup({
			style = 'warmer',
			transparent = false,
			ending_tildes = false,
			term_colors = true,
			cmp_itemkind_reverse = true,
			code_style = {
				comments = 'italic',
				keywords = 'none',
				functions = 'none',
				strings = 'none',
				variables = 'none'
			},
			diagnostics = {
				darker = true, -- darker colors for diagnostic
				undercurl = true, -- use undercurl instead of underline for diagnostics
				background = true, -- use background color for virtual text
			},

		})

		vim.cmd('colorscheme onedark')
	end,
}
