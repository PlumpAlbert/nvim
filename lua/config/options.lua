local opt = vim.opt
local icons = require("config.icons")

opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.foldcolumn = "1"
opt.cursorline = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.mousemoveevent = true
opt.updatetime = 250
opt.timeoutlen = 400
opt.ttimeout = true
opt.ttimeoutlen = 10
opt.autoread = true
opt.title = true
opt.scrolloff = 8
opt.sidescrolloff = 8
if vim.fn.exists("&scrolloffpad") == 1 then
  opt.scrolloffpad = 8
end

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.list = true
opt.listchars = {
  tab = "󰌒 ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "󱁐",
}
opt.fillchars = {
  eob = icons.ui.eob,
  fold = " ",
  foldopen = icons.ui.fold_open,
  foldclose = icons.ui.fold_closed,
  foldsep = icons.ui.fold_sep,
  diff = "╱",
  msgsep = icons.ui.horizontal,
  horiz = icons.ui.horizontal,
  horizup = "┴",
  horizdown = "┬",
  vert = icons.ui.vertical,
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
}
if vim.fn.exists("&winborder") == 1 then
  opt.winborder = "rounded"
end

-- Treesitter folding. Neovim 0.13 can assign Lua functions directly to expr options.
opt.foldmethod = "expr"
if vim.fn.has("nvim-0.13") == 1 then
  vim.o.foldexpr = function()
    return vim.treesitter.foldexpr()
  end
  if vim.lsp.foldtext then
    vim.o.foldtext = function()
      return vim.lsp.foldtext()
    end
  end
else
  opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
end
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
    },
  },
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  virtual_lines = vim.fn.has("nvim-0.13") == 1 and {
    current_line = true,
    overflow = "wrap",
  } or false,
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
})
