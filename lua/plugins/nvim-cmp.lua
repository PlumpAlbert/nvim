-- vim:ft=lua:ts=4:sw=0
local cmp = require "cmp"
local lspkind = require "lspkind"

cmp.setup({
	view = {
		entries = "native",
	},
	formatting = {
		fields = { "kind", "abbr" },
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters
			menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			}),
		 })
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
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
		{ name = 'nvim_lua' },
		{ name = 'path' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	})
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	})
})
