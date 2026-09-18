return {
  {
    "carderne/pi-nvim",
    config = function()
      require("pi-nvim").setup({
        socket_path = nil, -- auto-discover running pi sessions
        set_default_keymaps = true, -- <leader>p opens the Pi dialog
      })

      vim.keymap.set("n", "<leader>pp", "<cmd>PiSend<cr>", { desc = "Pi: send prompt" })
      vim.keymap.set("n", "<leader>pf", "<cmd>PiSendFile<cr>", { desc = "Pi: send file" })
      vim.keymap.set("v", "<leader>ps", ":<C-u>PiSendSelection<cr>", { desc = "Pi: send selection" })
      vim.keymap.set("n", "<leader>pb", "<cmd>PiSendBuffer<cr>", { desc = "Pi: send buffer" })
      vim.keymap.set("n", "<leader>pi", "<cmd>PiPing<cr>", { desc = "Pi: ping" })
      vim.keymap.set("n", "<leader>pl", "<cmd>PiSessions<cr>", { desc = "Pi: sessions" })
    end,
  },
}
