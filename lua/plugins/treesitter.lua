return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = "VeryLazy",
		config = function(_, opts)
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				ensure_installed = vim.list_extend({
					"markdown_inline",
					"lua",
					"vim",
					"vimdoc",
					"query",
				}, opts.ensure_installed or {}),
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
				context_commentstring = { enable = true },
			})
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
		config = true,
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
	{
		"HiPhish/rainbow-delimiters.nvim",
		init = function()
			local rainbow = require("rainbow-delimiters")

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow.strategy["global"],
					vim = rainbow.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
}
