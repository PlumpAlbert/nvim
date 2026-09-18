local map = vim.keymap.set

map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
map("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", "zR", "zR", { desc = "Open all folds" })
map("n", "zM", "zM", { desc = "Close all folds" })
map("n", "za", "za", { desc = "Toggle fold" })
map("n", "<leader>ee", function()
  local dir = vim.fn.expand("%:p:h")
  if dir == "" then
    dir = vim.fn.getcwd()
  end
  vim.cmd.edit(vim.fn.fnameescape(dir))
end, { desc = "Explorer: current file directory" })
map("n", "<leader>ew", function()
  vim.cmd.edit(vim.fn.fnameescape(vim.fn.getcwd()))
end, { desc = "Explorer: working directory" })

-- fzf-lua
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Help" })
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent files" })

-- git pickers
map("n", "<leader>gs", "<cmd>FzfLua git_status<cr>", { desc = "Git status" })
map("n", "<leader>gc", "<cmd>FzfLua git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>gC", "<cmd>FzfLua git_bcommits<cr>", { desc = "Git buffer commits" })
map("n", "<leader>gb", "<cmd>FzfLua git_branches<cr>", { desc = "Git branches" })
