-- vim:ft=lua:ts=4:sw=0:noet
return {
	{ "folke/which-key.nvim",  config = false },
	{ "folke/neoconf.nvim",    cmd = "Neoconf", config = false },
	{ "folke/neodev.nvim",     config = false },
	{ "wakatime/vim-wakatime", lazy = false,    config = false },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		opts = require("config.neotree"),
		keys = {
			{ "<leader><space>", "<cmd>Neotree toggle<cr>", desc = "Open neotree" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				opts = {
					autoselect_one = true,
					include_current = false,
					filter_rules = {
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { "neo-tree", "neo-tree-popup", "notify" },

							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal", "quickfix" },
						},
					},
					-- other_win_hl_color = '#e35e4f',
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				config = function()
					require "config.lsp"
				end
			},
			{
				"williamboman/mason.nvim",
				config = false,
				build = ":MasonUpdate",
				opts = {
					max_concurrent_installers = 2,
					ui = {
						border = "rounded",
						width = 0.8,
						height = 0.8,
						icons = {
							-- The list icon to use for installed packages.
							package_installed = "",
							-- The list icon to use for packages that are installing, or queued for installation.
							package_pending = "",
							-- The list icon to use for packages that are not installed.
							package_uninstalled = "",
						},
					},
				},
			},
		},
		opts = {
			ensure_installed = { "lua_ls" },
		}
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("config.nullls")
				end,
			},
		},
		opts = {
			ensure_installed = { "stylua", "jq" },
			automatic_installation = true,
		},
	},
}
