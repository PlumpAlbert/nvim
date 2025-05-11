return {
	-- nvim-treesitter/nvim-treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		lazy = false,
		init = function()
			vim.opt.foldenable = true
			vim.opt.foldmethod = 'expr'
			vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

			vim.filetype.add {
				extension = {
					mdx = 'mdx',
					gotmpl = 'gotmpl',
				},
				pattern = {
					['.*/templates/.*%.tpl'] = 'helm',
					['.*/templates/.*%.ya?ml'] = 'helm',
					['helmfile.*%.ya?ml'] = 'helm',
				},
			}
		end,
		opts = {
			ensure_installed = { 'markdown', 'markdown_inline', 'lua', 'bash', 'vim' },
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { 'ruby' },
			},
			indent = { enable = true, disable = { 'ruby' } },
		},
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
			vim.treesitter.language.register('markdown', 'mdx')
		end,
	},
	-- windwp/nvim-ts-autotag
	{
		'windwp/nvim-ts-autotag',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		lazy = false,
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
	},
	-- HiPhish/rainbow-delimiters.nvim
	{
		'HiPhish/rainbow-delimiters.nvim',
		lazy = false,
		init = function()
			local rainbow_delimiters = require 'rainbow-delimiters'

			vim.g.rainbow_delimiters = {
				strategy = {
					[''] = rainbow_delimiters.strategy['global'],
					vim = rainbow_delimiters.strategy['local'],
				},
				query = {
					[''] = 'rainbow-delimiters',
					lua = 'rainbow-blocks',
					latex = 'rainbow-blocks',
				},
				priority = {
					[''] = 110,
					lua = 210,
					latex = 210,
				},
				highlight = {
					'RainbowDelimiterRed',
					'RainbowDelimiterYellow',
					'RainbowDelimiterBlue',
					'RainbowDelimiterOrange',
					'RainbowDelimiterGreen',
					'RainbowDelimiterViolet',
					'RainbowDelimiterCyan',
				},
			}
		end,
	},
	-- folke/ts-comments.nvim
	{
		'folke/ts-comments.nvim',
		opts = {},
		event = 'VeryLazy',
		enabled = vim.fn.has 'nvim-0.10.0' == 1,
	},
}
