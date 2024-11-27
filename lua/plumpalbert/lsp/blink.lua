return {
	"saghen/blink.cmp",
	lazy = false,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		{
			"saghen/blink.compat",
			version = "*",
			opts = { impersonate_nvim_cmp = true },
		},
	},
	version = "v0.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		accept = {
			expand_snippet = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
		},
		keymap = { preset = "default" },
		highlight = {
			use_nvim_cmp_as_default = true,
		},
		nerd_font_variant = "normal",
		sources = {
			completion = {
				enabled_provider = {
					"lsp",
					"luasnip",
					"buffer",
				},
			},
			providers = {
				luasnip = {
					name = "luasnip",
					module = "blink.compat.source",
					score_offset = -1,
					opts = {
						use_show_condition = false,
						show_autosnippets = true,
					},
				},
			},
		},
	},
	opts_extend = { "sources.completion.enabled_providers" },
}
