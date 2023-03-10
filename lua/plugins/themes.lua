return {
  {
    "xiyaowong/nvim-transparent",
    cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
    keys = {
      { "<leader>t", vim.cmd.TransparentToggle, desc = "Toggle transparency" },
    },
  },
  {
    "Mofiqul/vscode.nvim",
    config = true,
    opts = function()
      local c = require("vscode.colors").get_colors()
      return {
        transparent = true,
        italic_comments = true,
        group_overrides = {
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      }
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus",
      },
    },
    config = true,
  },
  {
    "Yazeed1s/minimal.nvim",
    config = function()
      vim.g.minimal_italic_comments = true
      vim.g.minimal_italic_keywords = false
      vim.g.minimal_italic_booleans = false
      vim.g.minimal_italic_functions = false
      vim.g.minimal_italic_variables = false
      vim.g.minimal_transparent_background = true
    end,
  },
}
