local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
	},
}

M.config = function()
	local zero = require("lsp-zero")
	zero.extend_cmp()

	local cmp = require("cmp")
	local action = zero.cmp_action()

	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		formatting = zero.cmp_format({ details = false, max_width = 20 }),
		preselect = "item",
		completion = {
			autocomplete = false,
			completeopt = "menu,menuone,noinsert",
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
	})
end

return M
