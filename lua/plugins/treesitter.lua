local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
		},
		{
			"windwp/nvim-ts-autotag",
			event = "VeryLazy",
		},
		{
			"nvim-treesitter/nvim-treesitter-refactor",
			event = "VeryLazy",
		},
	},
}

function M.config()
	require("nvim-treesitter.install").prefer_git = false
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		auto_install = true,
		sync_install = false,
		modules = {},
		ignore_install = {},
		ensure_installed = {
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"typescript",
			"tsx",
		},

		highlight = {
			enable = true,
			disable = {},
		},

		indent = {
			enable = true,
			disable = { "python", "css" },
		},

		autotag = { enable = true },

		refactor = {
			highlight_definitions = {
				enable = true,
				clear_on_cursor_move = false,
			},
			navigation = {
				enable = true,
				keymaps = {
					goto_definition_lsp_fallback = "gd",
					list_definitions = "<leader>lD",
					list_definitions_toc = "<leader>lO",
					goto_next_usage = "<a-]>",
					goto_previous_usage = "<a-[>",
				},
			},
		},
	})

	vim.g.skip_ts_context_commentstring_module = true
	require("ts_context_commentstring").setup({ enable_autocmd = false })
end

return M
