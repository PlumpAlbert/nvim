local function window_title()
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

	local icon, hl, is_default = MiniIcons.get("file", vim.fn.expand("%:t"))

	return string.format(
		"[%s] %s %s",
		cwd,
		icon,
		vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
	)
end

local function get_font()
	if vim.fn.has("win32") == 1 then
		return "Iosevka=48;Symbols Nerd Font=48;Segoe UI Emoji=48"
	end

	return "monospace=48;Symbols Nerd Font=48"
end

return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	enabled = vim.fn.has("win32") == 1,
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
		font = get_font(),
		theme = "gruvbox-dark",
		background = "#98C379",
		background_image = nil,
		pad_horiz = 96,
		pad_vert = 64,
		no_round_corner = false,
		no_window_controls = true,
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
		window_title = window_title,
		wslclipboard = "auto",
		wslclipboardcopy = "delete",
		command = "silicon",
		output = nil,
	},
}
