return {
	"williamboman/mason.nvim",
	event = { "VeryLazy" },
	config = true,
	opts = {
		ui = {
			icons = {
				package_installed = "",
				package_pending = "",
				package_uninstalled = "",
			},
		},
	},
}
