return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
	version = "v0.*",
	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
		completion = {
			documentation = {
				auto_show = true,
			},
			ghost_text = {
				enabled = false,
			},
			list = {
				selection = function(ctx)
					if ctx.mode == "cmdline" then
						return "auto_insert"
					end

					return "preselect"
				end,
			},
		},
		signature = { enabled = true },
		sources = {
			default = { "lsp", "path", "luasnip", "buffer" },
		},
	},
}
