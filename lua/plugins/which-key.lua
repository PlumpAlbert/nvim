return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 400,
      spec = {
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "hunks" },
        { "<leader>l", group = "lsp/format" },
        { "<leader>p", group = "pi" },
        { "<leader>e", group = "explorer/diagnostics" },
      },
    },
  },
}
