local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"onsails/lspkind.nvim",
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
	},
}

M.config = function()
	local zero = require("lsp-zero")
	local cmp = require("cmp")
	local action = zero.cmp_action()

	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		formatting = {
			fields = { "kind", "abbr", "menu" },
			expandable_indicator = true,
			format = require("lspkind").cmp_format({
				mode = "symbol",
				maxwidth = 50,
				ellipsis_char = "...",
			}),
		},
		completion = {
			autocomplete = { "InsertEnter" },
			completeopt = "menu,menuone,noinsert,popup",
		},
		mapping = cmp.mapping.preset.insert({
			["<C-f>"] = action.luasnip_jump_forward(),
			["<C-b>"] = action.luasnip_jump_backward(),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "lazydev" },
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "luasnip", keyword_length = 2 },
			{ name = "buffer", keyword_length = 3 },
		}),
	})
end

return M
