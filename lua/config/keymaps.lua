local map = vim.keymap.set

map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
map({ "n", "i" }, "<C-s>", "<esc>:wa<cr>", { desc = "Save all changes" })
map({ "n", "v" }, "Y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", "j", "gj", { desc = "Move down by display line" })
map("n", "k", "gk", { desc = "Move up by display line" })
map("v", "j", "gj", { desc = "Move down by display line" })
map("v", "k", "gk", { desc = "Move up by display line" })
map("v", "<", "<gv", { desc = "Indent selection left" })
map("v", ">", ">gv", { desc = "Indent selection right" })
map("v", "p", '"_dP', { desc = "Paste without replacing clipboard" })
map("v", "J", ":m .+1<CR>==", { desc = "Move selection down" })
map("v", "K", ":m .-2<CR>==", { desc = "Move selection up" })
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move selection down" })
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move selection up" })

if vim.g.vscode then
  require("config.keymaps.vscode")
else
  require("config.keymaps.neovim")
end

-- Git pickers are shared by both profiles.
map("n", "<leader>gs", "<cmd>FzfLua git_status<cr>", { desc = "Git status" })
map("n", "<leader>gc", "<cmd>FzfLua git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>gl", "<cmd>FzfLua git_bcommits<cr>", { desc = "Git buffer commits" })
map("n", "<leader>gb", "<cmd>FzfLua git_branches<cr>", { desc = "Git branches" })
