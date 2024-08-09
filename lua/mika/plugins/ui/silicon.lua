local utils = require("mika.utils")

return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	main = "nvim-silicon",
	keys = {
		{
			"<leader>s",
			function()
				require("nvim-silicon").shoot()
			end,
			desc = "Code snapshot",
		},
		{
			mode = "v",
			"<leader>s",
			function()
				require("nvim-silicon").clip()
			end,
			desc = "Code snapshot",
		},
	},
	opts = {
		debug = false,
		font = utils.get_font(),
		theme = "Dracula",
		background = "#D6ACFF",
		background_image = nil,
		pad_horiz = 96,
		pad_vert = 64,
		no_round_corner = false,
		no_window_controls = false,
		no_line_number = false,
		line_offset = function(args)
			if args.range == 1 then
				return args.line1
			end

			return 1
		end,
		line_pad = 0,
		tab_width = 4,
		language = function()
			local ft = vim.bo.filetype

			if ft == "jsonc" then
				return "json"
			end

			return ft
		end,
		shadow_blur_radius = 24,
		shadow_offset_x = 8,
		shadow_offset_y = 8,
		shadow_color = "#100808",
		gobble = true,
		num_separator = "\u{258f} ",
		to_clipboard = true,
		window_title = utils.file_title,
		wslclipboard = vim.fn.has("win32") == 1 and "auto" or nil,
		wslclipboardcopy = vim.fn.has("win32") == 1 and "delete" or nil,
		command = "silicon",
		output = nil,
	},
}
