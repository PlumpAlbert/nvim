if not vim.g.neovide then
	return
end

local size = 14

local function get_font()
	return "Iosevka,Symbols_Nerd_Font:h" .. size
end

vim.o.guifont = get_font()
vim.g.neovide_transparency = 0.92
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_vfx_mode = "wireframe"
vim.g.neovide_maximized = true

-- Clipboard management
vim.keymap.set("i", "<C-S-v>", "<C-r>+", { desc = "Paste from clipboard" })
vim.keymap.set("c", "<C-S-v>", "<C-r>+", { desc = "Paste from clipboard" })

-- font change
vim.keymap.set({ "n", "i" }, "<C-=>", function()
	size = size + 1
	vim.o.guifont = get_font()
end, { desc = "Increase font size" })

vim.keymap.set({ "n", "i" }, "<C-->", function()
	size = size - 1
	vim.o.guifont = get_font()
end, { desc = "Increase font size" })

-- toggle fullscreen
vim.keymap.set({ "n", "i", "v" }, "<F11>", function()
	vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { desc = "Toggle fullscreen" })
