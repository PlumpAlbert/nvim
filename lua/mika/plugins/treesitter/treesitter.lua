local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate all",
	event = { "BufRead", "BufEnter", "BufNewFile" },
}

M.dependencies = {
	"HiPhish/rainbow-delimiters.nvim",
	"windwp/nvim-ts-autotag",
	"folke/ts-comments.nvim",
}

M.config = function(_, opts)
	opts = opts or {}

	require("nvim-treesitter.install").prefer_git = vim.fn.has("unix") == 1

	local ensure_installed = vim.list_extend({
		"lua",
		"vim",
		"vimdoc",
		"markdown",
		"markdown_inline",
		"comment",
	}, opts.ensure_installed or {})

	require("nvim-treesitter.configs").setup({
		auto_install = true,
		ensure_installed = ensure_installed,
		highlight = { enable = true },
		indent = { enable = true },
	})
end

return M
