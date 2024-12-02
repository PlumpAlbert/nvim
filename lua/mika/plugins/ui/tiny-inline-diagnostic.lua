return {
	"rachartier/tiny-inline-diagnostic.nvim",
	enabled = true,
	event = { "BufNewFile", "BufRead", "BufEnter" },
	config = true,
	opts = {
		preset = "ghost",
		options = {
			softwrap = 30,
			overflow = {
				mode = "none",
			},
		},
	},
}
