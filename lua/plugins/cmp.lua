local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			dependencies = {
				"rafamadriz/friendly-snippets"
			}
		},
		"hrsh7th/cmp-nvim-lua",
	},
	event = {
		"InsertEnter",
		"CmdlineEnter"
	}
}

function M.config()
	local cmp =require"cmp"
	local luasnip = require"luasnip"
	require"luasnip/loaders/from_vscode".lazy_load()

	local check_backspace = function()
		local col = vim.fn.col "." - 1
		return col == 0 or vim.fn.getline('.'):sub(col,col):match '%s'
	end

	cmp.setup {
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end
		},
		mapping = cmp.mapping.preset.insert {
			['<C-k>'] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping {
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			},
			["<CR>"] = cmp.mapping.confirm({select = true}),
		}
	}
end

return M
