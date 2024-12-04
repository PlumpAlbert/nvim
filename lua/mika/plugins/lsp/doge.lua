return {
	"kkoomen/vim-doge",
	event = "VeryLazy",
	init = function()
		vim.g.doge_enable_mappings = 0
	end,
	build = function()
		vim.cmd("call doge#install()")
	end,
	keys = {
		{
			"<leader>d",
			"<Plug>(doge-generate)",
			desc = "Generate documentation",
		},
	},
}
