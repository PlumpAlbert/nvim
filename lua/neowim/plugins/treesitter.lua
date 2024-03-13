local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate all",
}

local rainbow = {
	"HiPhish/rainbow-delimiters.nvim",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")

		require("rainbow-delimiters.setup").setup({
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				vim = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			priority = {
				[""] = 110,
				lua = 210,
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
		})
	end,
}

M.dependencies = {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	rainbow,
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
}

M.config = function(_, opts)
	opts = opts or {}

	require("nvim-treesitter.install").prefer_git = false

	local ensure_installed = vim.list_extend({
		"lua",
		"vim",
		"vimdoc",
		"markdown",
		"markdown_inline",
		"comment",
	}, opts.ensure_installed or {})

	require("nvim-treesitter.configs").setup({
		auto_install = false,
		ensure_installed = ensure_installed,
		highlight = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gis",
				node_incremental = "]sn",
				scope_incremental = "]ss",
				node_decremental = "<BS>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookagead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
				},
			},
		},
		indent = { enable = true },
		-- rainbow = {
		-- 	enable = true,
		-- 	query = {
		-- 		"rainbow-parens",
		-- 		html = "rainbow-tags",
		-- 		tsx = "rainbow-tags",
		-- 		vue = "rainbow-tags",
		-- 		javascript = "rainbow-parens-react",
		-- 		latex = "rainbow-blocks",
		-- 	},
		-- },
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = false,
		},
		ts_context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M
