local M = {
	-- "hrsh7th/nvim-cmp",
	"iguanacucumber/magazine.nvim",
	name = "nvim-cmp",
	event = { "BufEnter", "BufRead", "BufNewFile" },
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip",
	},
}

M.config = function()
	local zero = require("lsp-zero")
	local cmp = require("cmp")
	local action = zero.cmp_action()

	cmp.setup({
		formatting = {
			fields = { "kind", "abbr", "menu" },
			expandable_indicator = true,
			format = require("lspkind").cmp_format({
				mode = "symbol",
				maxwidth = 50,
				ellipsis_char = "...",
				show_labelDetails = true,
				symbol_map = {
					HF = "",
					OpenAI = "",
					Codestral = "",
					Bard = "",
					Ollama = "🦙",
				},
			}),
		},
		completion = {
			autocomplete = { "InsertEnter" },
			completeopt = "menu,menuone,noinsert,popup",
		},
		mapping = cmp.mapping.preset.insert({
			["<C-l>"] = action.luasnip_jump_forward(),
			["<C-h>"] = action.luasnip_jump_backward(),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "lazydev" },
			{ name = "nvim_lsp" },
		}, {
			{ name = "luasnip", keyword_length = 2 },
		}, {
			{ name = "buffer", keyword_length = 3 },
		}, {
			{ name = "path" },
		}),
	})
end

return M
