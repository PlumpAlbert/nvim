local M = {
	"folke/neoconf.nvim",
	lazy = false,
	priority = 999,
	config = true,
}

M.opts = {
	live_reload = true,
	plugins = {
		lspconfig = {
			enabled = true,
		},
		jsonls = {
			enabled = true,
			configured_servers_only = false,
		},
		lua_ls = {
			enabled = false,
			enabled_for_neovim_config = true,
		},
	},
}

return M
