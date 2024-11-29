return {
	"echasnovski/mini.statusline",
	version = "*",
	lazy = false,
	config = true,
	priority = 9999,
	opts = {
		use_icons = true,
		set_vim_settings = true,
		content = {
			active = function()
				local mode, mode_hl =
					MiniStatusline.section_mode({ trunc_width = 999999999999 })

				local git = MiniStatusline.section_git({ trunc_width = 100 })
				local filename = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")

				return MiniStatusline.combine_groups({
					{ hl = mode_hl, strings = { mode } },
					{ hl = "MiniStatuslineDevinfo", strings = { git } },
					"%<",
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					"%=",
				})
			end,
			inactive = function()
				local git = MiniStatusline.section_git({ trunc_width = 100 })
				local filename = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")

				return MiniStatusline.combine_groups({
					{ hl = "MiniStatuslineDevinfo", strings = { git } },
					"%<",
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					"%=",
				})
			end,
		},
	},
}
