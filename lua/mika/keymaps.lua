vim.keymap.set({ "n", "v" }, "Y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "i" }, "<C-s>", "<esc>:wa<cr>", { desc = "Save changes" })
