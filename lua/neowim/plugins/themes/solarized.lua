return {
	'maxmx03/solarized.nvim',
	priority = 1000,
	lazy = false,
	config = function()
		vim.o.background = 'dark'

		require('solarized').setup({
			transparent = false,
			palette = 'solarized',
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
			},
			theme = 'neo',
			autocmd = true
		})

		vim.cmd('colorscheme solarized')
	end
}
