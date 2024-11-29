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
	init = function()
		vim.o.completeopt = 'menu,menuone,noselect'
	end,
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
				['<C-n>'] = cmp.mapping.select_next_item({
					behavior = cmp.SelectBehavior.Select
				}),
				['<C-p>'] = cmp.mapping.select_prev_item({
					behavior = cmp.SelectBehavior.Select
				}),
				['<C-y>'] = cmp.mapping.confirm({
					select = true,
					behavior = cmp.ConfirmBehavior.Replace,
				}),
				['<CR>'] = cmp.mapping.confirm({
					select = true,
					behavior = cmp.ConfirmBehavior.Replace,
				})
			}),
			sources = cmp.config.sources({
				{name = 'lazydev', group_index = 0},
				{name = 'nvim_lsp', group_index = 1},
				{name = 'luasnip', max_item_count = 10},
				{name= 'buffer', keyword_length = 3, group_index = 99}
			}),
			performance = {
				max_view_entries = 10,
			},
			experimental = {
				ghost_text = true
			}
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
			},
			performance = {
				max_view_entries = 5,
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
