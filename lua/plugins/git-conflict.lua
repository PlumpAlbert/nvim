return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = true,
	event = "BufReadPre",
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
