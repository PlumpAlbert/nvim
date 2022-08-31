vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require('catppuccin').setup({
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = true,
  term_colors = true,
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
    suffix = "_compiled"
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    cmp = true,
    lsp_saga = true,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    dashboard = true,
    barbar = true,
    markdown = true,
    ts_rainbow = true,
    notify = true,
    symbols_outline = true,
    -- off
    telekasten = false,
    coc_nvim = false,
    lsp_trouble = false,
    gitgutter = false,
    neotree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
    dap = {
      enabled = false,
      enable_ui = false,
    },
    which_key = false,
    neogit = false,
    vim_sneak = false,
    fern = false,
    bufferline = false,
    lightspeed = false,
    hop = false,
    mini = false,
  }
})
