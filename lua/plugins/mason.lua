local M = {
	"williamboman/mason.nvim",
	cmd = "Mason",
	event = "BufReadPre",
}

M.opts = {
	ui = {
		border = "none",
		icons = {
			package_installed = "󰝥",
			package_pending = "󰻃",
			package_uninstalled = "",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

return M
