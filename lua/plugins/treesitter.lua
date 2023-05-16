return {
	{
		"nvim-treesitter/nvim-treesitter",
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
	{ "HiPhish/nvim-ts-rainbow2", dependencies = "nvim-treesitter/nvim-treesitter" },
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter/nvim-treesitter" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", dependencies = "nvim-treesitter/nvim-treesitter" },
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
		opts = {
			mappings = {
				add = "<leader>gza", -- Add surrounding in Normal and Visual modes
				delete = "<leader>gzd", -- Delete surrounding
				find = "<leader>gzf", -- Find surrounding (to the right)
				find_left = "<leader>gzF", -- Find surrounding (to the left)
				highlight = "<leader>gzh", -- Highlight surrounding
				replace = "<leader>gzr", -- Replace surrounding
				update_n_lines = "<leader>gzn", -- Update `n_lines`
			},
		},
	},
}
