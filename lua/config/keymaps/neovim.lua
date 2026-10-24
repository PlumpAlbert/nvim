local map = vim.keymap.set

map("n", "zR", "zR", { desc = "Open all folds" })
map("n", "zM", "zM", { desc = "Close all folds" })
map("n", "za", "za", { desc = "Toggle fold" })

map("n", "<leader><Space>", "<cmd>FzfLua files<cr>", { desc = "Find files" })
map("n", "<leader>/", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>,", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Help" })
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>r", "<cmd>FzfLua resume<cr>", { desc = "Resume last picker" })
map("n", "<leader>ls", "<cmd>FzfLua lsp_references<cr>", { desc = "LSP references" })
map("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<cr>", { desc = "LSP definitions" })
map("n", "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "LSP workspace symbols" })
map("n", "<leader>la", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "LSP code actions" })
map("n", "<leader>lt", "<cmd>FzfLua lsp_typedefs<cr>", { desc = "LSP type definitions" })
