return {
	'saghen/blink.cmp',
	version = '1.*',
	dependencies = {
		'L3MON4D3/LuaSnip',
		'rafamadriz/friendly-snippets',
		'milanglacier/minuet-ai.nvim',
	},
	opts_extend = { 'sources.default' },
	---@module "blink-cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = 'default',
			['<Tab>'] = {},
			['<S-Tab>'] = {},
			['<C-n>'] = { 'show', 'select_next', 'fallback' },
			['<C-p>'] = { 'show', 'select_prev', 'fallback' },
			['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
			['<C-;>'] = require('minuet').make_blink_map(),
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'normal',
			kind_icons = {
				Ollama = '🦙',
			},
		},
		sources = {
			default = { 'lsp', 'snippets', 'buffer', 'path' },
			providers = {
				minuet = {
					name = 'minuet',
					module = 'minuet.blink',
					async = true,
					score_offset = 50,
					timeout_ms = 3000,
				},
			},
		},
		completion = {
			list = {
				selection = {
					preselect = function(ctx)
						return ctx.mode ~= 'cmdline'
					end,
					auto_insert = function(ctx)
						return ctx.mode == 'cmdline'
					end,
				},
			},
			accept = {
				create_undo_point = true,
				auto_brackets = { enabled = false },
			},
			menu = {
				enabled = true,
				min_width = 16,
				max_height = 8,
				border = 'none',
				draw = {
					align_to = 'cursor',
					columns = {
						{ 'kind_icon' },
						{ 'label',    gap = 1 },
					},
				},
			},
			documentation = { auto_show = true },
			ghost_text = { enabled = false },
			trigger = {
				prefetch_on_insert = false,
			},
		},
		snippets = { preset = 'luasnip' },
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		signature = { enabled = true },
	},
}
