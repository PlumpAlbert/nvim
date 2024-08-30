return {
	"onsails/lspkind.nvim",
	event = { "BufNewFile", "BufRead", "BufEnter" },
	config = true,
	opts = {
		mode = "symbol_text",
		preset = "codicons",
	},
}
