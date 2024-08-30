return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufNewFile", "BufRead", "BufEnter" },
	config = true,
	opts = {
		user_default_options = {
			css = true,
			css_fn = true,
			mode = "background",
			tailwind = "lsp",
			always_update = false,
			sass = {
				enable = true,
				parsers = { "css" },
			},
		},
	},
}
