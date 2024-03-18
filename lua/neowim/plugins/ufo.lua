return {
	"kevinhwang91/nvim-ufo",
	-- disable for neovim 0.10.0+
	enabled = vim.version().api_level < 12,
	event = { "BufRead", "BufNewFile" },
	dependencies = {
		"kevinhwang91/promise-async",
		"hrsh7th/nvim-cmp",
	},
	init = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	keys = {
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
			desc = "Close all folds",
		},
		{
			"zm",
			function()
				require("ufo").closeAllFolds()
			end,
			desc = "Close all folds",
		},
		{
			"zr",
			function()
				require("ufo").openFoldsExceptKinds({ "imports", "comment" })
			end,
			desc = "Open all except comments and imports",
		},
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
			desc = "Open all folds",
		},
	},
	config = function()
		require("ufo").setup({
			open_fold_hl_timeout = 150,
			close_fold_kinds_for_ft = {
				default = { "imports", "comment" }
			},
		})
	end,
}
