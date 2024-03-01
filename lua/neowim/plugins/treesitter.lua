return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			dependencies = "nvim-treesitter/nvim-treesitter",
		},
		{
			"HiPhish/nvim-ts-rainbow2",
			dependencies = "nvim-treesitter/nvim-treesitter",
		},
		{
			"windwp/nvim-ts-autotag",
			dependencies = "nvim-treesitter/nvim-treesitter",
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			dependencies = "nvim-treesitter/nvim-treesitter",
		},
	},
	build = ":TSUpdate",
	config = function(_, opts)
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
			rainbow = {
				enable = true,
				query = {
					"rainbow-parens",
					html = "rainbow-tags",
					tsx = "rainbow-tags",
					vue = "rainbow-tags",
					javascript = "rainbow-parens-react",
					latex = "rainbow-blocks",
				},
			},
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
	end,
}
