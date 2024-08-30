return {
	"rachartier/tiny-inline-diagnostic.nvim",
	enabled = true,
	event = { "BufNewFile", "BufRead", "BufEnter" },
	config = true,
	opts = {
		options = {
			softwrap = 30,
			overflow = {
				mode = "none",
			},
		},
	},
}
