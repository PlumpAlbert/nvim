local in_vscode = vim.g.vscode
local in_herdr = vim.env.HERDR_ENV == "1"

if in_vscode then
  return {}
end

if in_herdr then
  return {
    {
      "lmilojevicc/herdr-splits.nvim",
      event = "VeryLazy",
      config = function()
        require("herdr-splits").setup()
      end,
      keys = {
        { "<C-h>", function() require("herdr-splits").move_cursor_left() end, desc = "Move to left pane or split" },
        { "<C-j>", function() require("herdr-splits").move_cursor_down() end, desc = "Move to lower pane or split" },
        { "<C-k>", function() require("herdr-splits").move_cursor_up() end, desc = "Move to upper pane or split" },
        { "<C-l>", function() require("herdr-splits").move_cursor_right() end, desc = "Move to right pane or split" },
        { "<A-h>", function() require("herdr-splits").resize_left() end, desc = "Resize left pane or split" },
        { "<A-j>", function() require("herdr-splits").resize_down() end, desc = "Resize lower pane or split" },
        { "<A-k>", function() require("herdr-splits").resize_up() end, desc = "Resize upper pane or split" },
        { "<A-l>", function() require("herdr-splits").resize_right() end, desc = "Resize right pane or split" },
      },
    },
  }
end

return {
  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
    opts = {
      ignored_filetypes = { "nofile", "quickfix", "prompt" },
      ignored_buftypes = { "nofile" },
    },
    keys = {
      { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
      { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move to lower split" },
      { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move to upper split" },
      { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
      { "<A-h>", function() require("smart-splits").resize_left() end, desc = "Resize split left" },
      { "<A-j>", function() require("smart-splits").resize_down() end, desc = "Resize split down" },
      { "<A-k>", function() require("smart-splits").resize_up() end, desc = "Resize split up" },
      { "<A-l>", function() require("smart-splits").resize_right() end, desc = "Resize split right" },
    },
  },
}
