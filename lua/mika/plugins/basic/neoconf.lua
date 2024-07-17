local M = {
	"folke/neoconf.nvim",
	lazy = false,
	priority = 999,
}

local defaultOptions = {
	indent = 4,
	useTabs = true,
	ruler = { 80 },
	theme = "retrobox",
	wrap = false,
}

M.init = function()
	require("neoconf.plugins").register({
		name = "neovim",
		on_schema = function(schema)
			schema:import("neovim", defaultOptions)
			schema:set("neovim.theme", {
				description = "Colorscheme to use",
				type = "string",
				enum = vim.fn.getcompletion("", "color"),
			})
		end,
	})
end

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

M.config = function(_, opts)
	local neoconf = require("neoconf")
	neoconf.setup(opts)

	local config = neoconf.get("neovim", defaultOptions)

	vim.opt.tabstop = config.indent
	vim.opt.expandtab = not config.useTabs
	vim.opt.colorcolumn = config.ruler
	vim.opt.wrap = config.wrap
	vim.cmd("colorscheme " .. config.theme)
end

return M
