vim.keymap.set({ "n", "v" }, "Y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "i" }, "<C-s>", "<esc>:wa<cr>", { desc = "Save changes" })

vim.keymap.set({ "n", "i", "v" }, "<F5>", function()
	local colorschemes = require("mika.utils").get_colorschemes()

	local index = math.random(1, #colorschemes)

	vim.notify("Colorscheme: " .. colorschemes[index])
	vim.cmd("colorscheme " .. colorschemes[index])
end)
