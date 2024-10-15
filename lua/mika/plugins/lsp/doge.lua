return {
	"kkoomen/vim-doge",
	event = "VeryLazy",
	init = function()
		vim.g.doge_enable_mappings = 0
	end,
	keys = {
		{
			"<leader>d",
			"<Plug>(doge-generate)",
			desc = "Generate documentation",
		},
	},
}
