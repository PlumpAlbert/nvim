return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			winopts = {
				fullscreen = true,
			},
		})
	end,
	keys = {
		{
			"<leader><Space>",
			function()
				require("fzf-lua").files({ resume = true })
			end,
		},
		{
			"<leader>,",
			function()
				require("fzf-lua").buffers()
			end,
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").live_grep()
			end,
		},
	},
}