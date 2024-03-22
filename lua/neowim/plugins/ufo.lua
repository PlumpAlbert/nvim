return {
	"kevinhwang91/nvim-ufo",
	-- disable for neovim 0.10.0+
	-- enabled = vim.version().api_level < 12,
	event = { "BufRead", "BufNewFile" },
	dependencies = {
		"kevinhwang91/promise-async",
		"hrsh7th/nvim-cmp",
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				local builtin = require('statuscol.builtin')
				require('statuscol').setup({
					relculright = true,
					segments = {
						{ text = { builtin.foldfunc },    cleck = "v:lua.ScFa" },
						{ text = { "%s" },                cleck = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, " " }, cleck = "v:lua.ScLa" },
					}
				})
			end
		}
	},
	init = function()
		vim.opt.foldcolumn = '1'
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:-,foldsep: ,foldclose:+]]
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
