-- vim:ft=lua:ts=4:sw=0
-- Author: Plump Albert (plumpalbert@gmail.com)

require('lualine').setup {
	options = {
		theme = vim.fn.has('win32') == 1 and 'gruvbox-material' or 'OceanicNext',
		icons_enabled = true,
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff'},
		lualine_c = {'filename'},
		lualine_x = {'filetype'},
		lualine_y = {'diagnostics'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {
		'nvim-tree',
		'toggleterm'
	}
}
