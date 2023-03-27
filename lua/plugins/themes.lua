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
    "shaunsingh/nord.nvim",
    config = function()
      -- Example config in lua
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = true
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
    end,
  },
  {
    "sainnhe/everforest",
    init = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = false
      vim.g.everforest_disable_italic_comment = false
      vim.g.everforest_cursor = "green"
      vim.g.everforest_transparent_background = "2"
      vim.g.everforest_ui_contrast = "high"
      vim.g.everforest_show_eob = false
      vim.g.everforest_diagnostic_text_highlight = true
      vim.g.everforest_diagnostic_virtual_text = "colored"
      vim.g.everforest_current_word = "underline"
      vim.g.everforest_better_performance = true
    end,
  },
}
