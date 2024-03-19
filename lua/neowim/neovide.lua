if vim.g.neovide then
	vim.keymap.set({ "n", "s", "i", "c", "t" }, "<C-S-v>", "<c-r>+", { desc = "Paste" })
end
