return {
	"anuvyklack/pretty-fold.nvim",
	dependencies = { "kevinhwang91/nvim-ufo" },
	name = "pretty-fold",
	config = true,
	opts = {
		keep_indentation = false,
		fill_char = "•",
		sections = {
			left = {
				"+",
				function()
					return string.rep("-", vim.v.foldlevel)
				end,
				" ",
				"number_of_folded_lines",
				":",
				"content",
			},
		},
	},
}
