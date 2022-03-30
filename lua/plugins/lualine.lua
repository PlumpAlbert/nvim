-- vim:ft=lua:ts=4:sw=0
-- Author: Plump Albert (plumpalbert@gmail.com)

require('lualine').setup {
	options = {
		theme = 'auto',
		icons_enabled = true,
		component_separators = { left = '', right = ''},
		section_separators = { left = '▶', right = ''},
		disabled_filetypes = {
			'TelescopePrompt',

		},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff'},
		lualine_c = {'filename'},
		lualine_x = {
			{'filetype',
				icon_only = true
			},
			{'fileformat',
				symbols = {
					unix = '', -- e712
					dos = '',  -- e70f
					mac = '',  -- e711
				}
			}
		},
		lualine_y = {'diagnostics'},
		lualine_z = {'g:currentContainer'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_c = {
			{'buffers',
				filetype_names = {
					TelescopePrompt = 'Telescope',
					dashboard = 'Dashboard',
					packer = 'Packer',
					fzf = 'FZF',
					alpha = 'Alpha',
					NvimTree = 'NvimTree'
				},
				buffer_color = {
					active = 'lualine_{section}_normal',
					inactive = 'lualine_{section}_inactive',
				}
			}
		},
		lualine_x = { 'tabs' },
	},
	extensions = {
		'nvim-tree',
		'toggleterm',
		'fugitive'
	}
}
