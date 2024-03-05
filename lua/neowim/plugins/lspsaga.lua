return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>la",
			":Lspsaga code_action<CR>",
			desc = "Code actions",
		},
		{
			"<leader>lk",
			":Lspsaga diagnostic_jump_prev<CR>",
			desc = "Previous diagnostic",
		},
		{
			"<leader>lj",
			":Lspsaga diagnostic_jump_next<CR>",
			desc = "Next diagnostic",
		},
		{
			"<F2>",
			":Lspsaga rename<CR>",
			desc = "Rename",
		},
	},
	config = function()
		require("lspsaga").setup({
			symbol_in_winbar = {
				enable = true,
			},
			implement = {
				enable = true,
			},
		})
	end,
}
