return {
	'askfiy/visual_studio_code',
	enabled = true,
	priority = 9999,
	lazy = false,
	config = function()
		require("visual_studio_code").setup({
			mode = 'dark',
			preset = true,
			transparent = false,
		})

		vim.cmd('colorscheme visual_studio_code')
	end
}
