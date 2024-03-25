return {
	"0oAstro/silicon.lua",
	event = { "BufNewFile", "BufRead" },
	keys = {
		{
			"<leader>cs",
			function()
				require("silicon").visualise_api({
					to_clip = true,
					show_buf = true,
				})
			end,
			desc = "Buffer snapshot",
		},
		{
			"<leader>cs",
			function()
				require("silicon").visualise_api({ to_clip = true })
			end,
			mode = "v",
			desc = "Code snapshot",
		},
		{
			"<leader>cv",
			function()
				require("silicon").visualise_api({
					to_clip = true,
					show_buf = true,
				})
			end,
			mode = "v",
			desc = "Buffer snapshot (highlight selected)",
		},
	},
	config = function(_, opts)
		require("silicon").setup(vim.tbl_extend("force", {
			theme = "OneHalfDark",
			output = "${year}-${month}-${date}T${time}.png",
			bgColor = vim.g.terminal_color_4,
			bgImage = "",
			roundCorner = true,
			windowControls = true,
			lineNumber = true,
			font = vim.fn.has("macunix") == 1 and "monospace" or "Iosevka",
			lineOffset = 1,
			linePad = 0,
			padHoriz = 64,
			padVert = 36,
			shadowBlurRadius = 12,
			shadowColor = "#1a1a1a",
			shadowOffsetX = 1,
			shadowOffsetY = 3,
			gobble = true,
			debug = false,
		}, opts or {}))
	end,
}
