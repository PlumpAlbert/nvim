return {
	"echasnovski/mini.comment",
	version = "*",
	event = { "BufRead", "BufNewFile" },
	config = function()
		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
				end,
				ignore_blank_line = true,
			},
			mappings = {
				comment = "gc",
				comment_line = "gcc",
				comment_visual = "gc",
				text_object = "gc",
			},
		})
	end,
}
