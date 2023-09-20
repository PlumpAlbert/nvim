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
	},
}
function M.config()
	require("nvim-treesitter.install").prefer_git = false
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "typescript" }, -- put the language you want in this array
		-- ensure_installed = "all", -- one of "all" or a list of languages
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "css" }, -- list of language that will be disabled
		},
		indent = { enable = true, disable = { "python", "css" } },

		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M
