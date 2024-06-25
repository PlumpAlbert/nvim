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
					MiniStatusline.section_mode({ trunc_width = 99999 })

				local git = MiniStatusline.section_git({ trunc_width = 100 })

				local filename =
					MiniStatusline.section_filename({ trunc_width = 999999 })

				local fileinfo =
					MiniStatusline.section_fileinfo({ trunc_width = 99999 })

				local location =
					MiniStatusline.section_location({ trunc_width = 99999 })

				return MiniStatusline.combine_groups({
					{ hl = mode_hl, strings = { mode } },
					{ hl = "MiniStatuslineDevinfo", strings = { git } },
					"%<",
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					"%=",
					{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
					{ hl = mode_hl, strings = { location } },
				})
			end,
			inactive = function()
				local git = MiniStatusline.section_git({ trunc_width = 100 })

				local filename =
					MiniStatusline.section_filename({ trunc_width = 999999 })

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

