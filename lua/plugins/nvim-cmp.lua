-- vim:ft=lua:ts=4:sw=0
local cmp = require "cmp"

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	mapping = {
		['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i','c'}),
		['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i','c'}),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i','c'}),
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','s'}),
		['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','s'}),
		['<C-c>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close()
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
	}, {
		{ name = 'buffer' },
	})
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	})
})
