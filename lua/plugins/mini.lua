return {
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup({
        mappings = {
          add = "gza",
          delete = "gzd",
          find = "gzf",
          find_left = "gzF",
          highlight = "gzh",
          replace = "gzr",
          update_n_lines = "gzn",
        },
      })
      require("mini.comment").setup()
      require("mini.pairs").setup()
      if not vim.g.vscode then
        require("mini.files").setup({
          windows = { preview = true },
        })
      end
    end,
  },
}
