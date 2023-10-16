return {
	"0oAstro/silicon.lua",
	config = true,
	event = "VeryLazy",
	keys = {
		{
			"<leader>cs",
			function()
				require("silicon").visualise_api({
					to_clip = true,
					show_buf = true,
				})
			end,
			desc = "Code snapshot",
		},
		{
			"<leader>cs",
			function()
				require("silicon").visualise_api({ to_clip = true })
			end,
			mode = "v",
			desc = "Code snapshot",
		},
	},
	opts = {
		theme = "OneHalfDark",
		output = "${year}-${month}-${date}T${time}.png",
		bgColor = vim.g.terminal_color_4,
		bgImage = "",
		roundCorner = true,
		windowControls = true,
		lineNumber = true,
		font = "Iosevka Nerd Font",
		lineOffset = 1,
		linePad = 0,

		padHoriz = 64,
		padVert = 32,
		shadowBlurRadius = 0,
		shadowColor = "#1a1a1a",
		shadowOffsetX = 8,
		shadowOffsetY = 8,
		gobble = true,
		debug = false,
	},
}
