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
  {
    "bluz71/vim-moonfly-colors",
    name = "nightfly",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.moonflyCursorColor = true
      vim.g.moonflyItalics = true
      vim.g.moonflyNormalFloat = false
      vim.g.moonflyTerminalColors = true
      vim.g.moonflyTransparent = true
      vim.g.moonflyUndercurls = true
      vim.g.moonflyUnderlineMatchParen = true
      vim.g.moonflyVirtualTextColor = true
      vim.g.moonflyWinSeparator = 2
    end,
  },
}
