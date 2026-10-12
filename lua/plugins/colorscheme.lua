return {
  {
    "EdenEast/nightfox.nvim",
    cond = not vim.g.vscode,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("carbonfox")
    end,
  },
}
