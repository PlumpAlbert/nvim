-- vim:ft=lua:ts=4:sw=0:noet
return {
	 { "folke/which-key.nvim", config = function() end },
	{ "folke/neoconf.nvim", cmd = "Neoconf", config = function() end },
	{"folke/neodev.nvim", config = function() end},
	{ "wakatime/vim-wakatime", lazy = false, config = function() end },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				's1n7ax/nvim-window-picker',
				opts = {
					autoselect_one = true,
					include_current = false,
					filter_rules = {
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { 'neo-tree', "neo-tree-popup", "notify" },

							-- if the buffer type is one of following, the window will be ignored
							buftype = { 'terminal', "quickfix" },
						},
					},
					-- other_win_hl_color = '#e35e4f',
				},
			}
		},
		opts = require"config.neotree",
		keys = {
			{ '<leader><space>', '<cmd>Neotree toggle<cr>', desc = 'Open neotree' }
		}
	},
}
