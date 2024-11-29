return {
	"iguanacucumber/magazine.nvim",
	name = 'nvim-cmp',
	dependencies = {
		{ "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
		{ "iguanacucumber/mag-nvim-lua", name = "cmp-nvim-lua" },
		{ "iguanacucumber/mag-buffer", name = "cmp-buffer" },
		{ "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
		{ 'L3MON4D3/LuaSnip' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'folke/lazydev.nvim' },
	},
	config = function ()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true })
			}),
			sources = cmp.config.sources({
				{name = 'lazydev', group_index = 0},
				{name = 'nvim_lsp'},
				{name = 'luasnip'},
			}, {
				{name= 'buffer'}
			})
		})

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{name='path'}
			}, {
				{name='cmdline'}
			}),
			matching = {
				disallow_symbol_nonprefix_matching = false
			}
		})

		cmp.setup.cmdline({'/','?'}, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})
	end
}
