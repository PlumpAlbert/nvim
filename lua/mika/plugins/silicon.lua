local function window_title()
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

	local icon = require("nvim-web-devicons").get_icon(
		vim.fn.expand("%:t:r"),
		vim.fn.expand("%:t:e"),
		{ default = true }
	)

	return string.format(
		"[%s] %s %s",
		cwd,
		icon,
		vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
	)
end

return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	main = "nvim-silicon",
	keys = {
		{
			"<leader>s",
			function()
				require("nvim-silicon").clip()
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
		font = "Maple Mono=24;Symbols Nerd Font=24;Segoe UI Emoji=24",
		theme = "Visual Studio Dark+",
		background = "#98C379",
		background_image = nil,
		pad_horiz = 96,
		pad_vert = 64,
		no_round_corner = false,
		no_window_controls = true,
		no_line_number = false,
		line_offset = function(args)
			if args.range == 2 then
				return args.line1
			end

			return 1
		end,
		line_pad = 0,
		tab_width = 4,
		language = function()
			return vim.bo.filetype
		end,
		shadow_blur_radius = 16,
		shadow_offset_x = 8,
		shadow_offset_y = 8,
		shadow_color = "#100808",
		gobble = true,
		num_separator = "\u{258f} ",
		to_clipboard = true,
		window_title = window_title,
		wslclipboard = "auto",
		wslclipboardcopy = "delete",
		command = "silicon",
		output = nil,
	},
}
