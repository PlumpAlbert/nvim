local M = {
	"kevinhwang91/nvim-ufo",
	enabled = false,
	event = "VeryLazy",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				local builtin = require("statuscol.builtin")
				require("statuscol").setup({
					relculright = true,
					segments = {
						{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
						{ text = { "%s" }, click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					},
				})
			end,
		},
	},
	config = function()
		vim.opt.fillchars = {
			eob = " ",
			fold = " ",
			foldopen = "",
			foldsep = " ",
			foldclose = "",
		}
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 9999 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 9999
		vim.o.foldenable = true

		require("ufo").setup({
			close_fold_kinds = { "imports", "comment" },
		})
	end,
	keys = {
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
		},
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
		},
		{
			"zm",
			function()
				require("ufo").closeFoldsWith(0)
			end,
		},
		{
			"zr",
			function()
				require("ufo").openFoldsExceptKinds({ "imports", "comment" })
			end,
		},
	},
}

return M
