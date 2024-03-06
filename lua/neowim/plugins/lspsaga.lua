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
			"<leader>lo",
			":Lspsaga outline<CR>",
			desc = "Show code outline",
		},
		{
			"<F2>",
			":Lspsaga rename ++project<CR>",
			desc = "Rename",
		},
		{
			"gd",
			":Lspsaga goto_definition<CR>",
			desc = "Go to definition",
		},
		{
			"gt",
			":Lspsaga goto_type_definition<CR>",
			desc = "Go to type definition",
		},
		{
			"<leader>ld",
			":Lspsaga show_buf_diagnostics<CR>",
			desc = "Show buffer diagnostics",
		},
		{
			"<leader>lD",
			":Lspsaga show_workspace_diagnostics<CR>",
			desc = "Show workspace diagnostics",
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
