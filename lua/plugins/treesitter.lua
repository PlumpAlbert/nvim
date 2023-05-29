return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		opts = function(_, opts)
			opts = opts or {}
			return {
				auto_install = true,
				ensure_installed = vim.list_extend({
					"markdown_inline",
					"lua",
					"vim",
					"vimdoc",
					"query",
				}, opts.ensure_installed or {}),
				highlight = { enabled = true },
				autotag = { enabled = true },
				context_commentstring = { enabled = true },
				rainbow = {
					enabled = true,
					-- Which query to use for finding delimiters
					query = "rainbow-parens",
					-- Highlight the entire buffer all at once
					strategy = require("ts-rainbow").strategy.global,
				},
			}
		end,
	},
	{
		"echasnovski/mini.comment",
		version = "*",
		event = "BufEnter",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		opts = {
			mappings = {
				comment = "gc",
				comment_line = "gcc",
				text_object = "gc",
			},
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring()
				end,
			},
		},
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		lazy = false,
		opts = {
			mappings = {
				add = "gza", -- Add surrounding in Normal and Visual modes
				delete = "gzd", -- Delete surrounding
				find = "gzf", -- Find surrounding (to the right)
				find_left = "gzF", -- Find surrounding (to the left)
				highlight = "gzh", -- Highlight surrounding
				replace = "gzr", -- Replace surrounding
				update_n_lines = "gzn", -- Update `n_lines`
			},
		},
	},
	{
		"m4xshen/autoclose.nvim",
		lazy = false,
		opts = {
			options = {
				disabled_filetypes = { "text", "markdown" },
				disable_when_touch = true,
			},
		},
	},
	{
		"nvim-pack/nvim-spectre",
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Find and replace",
			},
			{
				"<leader>sw",
				function()
					require("spectre").open_visual({ select_word = true })
				end,
				desc = "Find current word",
			},
			{
				"<leader>sw",
				function()
					require("spectre").open_visual()
				end,
				desc = "Find current word",
				mode = { "v" },
			},
			{
				"<leader>sw",
				function()
					require("spectre").open_file_search({ select_word = true })
				end,
				desc = "Search on current file",
			},
		},
	},
}
