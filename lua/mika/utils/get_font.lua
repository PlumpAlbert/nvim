local function get_font()
	if vim.fn.has("win32") == 1 then
		return "Iosevka=48;Symbols Nerd Font=48;Segoe UI Emoji=48"
	end

	return nil
end

return get_font
