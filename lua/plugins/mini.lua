return {
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.comment").setup()
      require("mini.pairs").setup()
      require("mini.files").setup({
        windows = { preview = true },
      })
    end,
  },
}
