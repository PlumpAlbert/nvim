return {
	"akinsho/git-conflict.nvim",
	version = "*",
	event = { "BufReadPre", "BufEnter" },
	config = true,
	opts = {
		default_mappings = true,
		default_commands = true,
		disable_diagnostics = true,
		list_opener = "copen",
		highlights = {
			incoming = "DiffAdd",
			current = "DiffText",
		},
	},
}
