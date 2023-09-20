local M = {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"kevinhwang91/nvim-ufo",
			dependencies = {"kevinhwang91/promise-async"},
			keys = {
				{ "zM", function() require"ufo".closeAllFolds() end },
				{ "zR", function() require"ufo".openAllFolds() end },
				{ "zm", function() require"ufo".closeFoldsWith(-1) end },
				{ "zr", function() require"ufo".closeFoldsWith(1) end },
			}
		}
	}
}

return M
