local M = {
	"ray-x/go.nvim",
	ft = { "go", "gomod" },
	build = ":lua require('go.install').update_all_sync()",
}

M.dependencies = {
	"ray-x/guihua.lua",
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",
}

M.config = function()
	require("go").setup()
end

return M
