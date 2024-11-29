return {
	"folke/ts-comments.nvim",
	event = { "BufRead", "BufEnter", "BufNewFile" },
	enabled = vim.fn.has("nvim-0.10.0") == 1,
	config = true,
}
