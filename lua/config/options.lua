local icons = require("config.icons")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.foldcolumn = "1"
vim.opt.cursorline = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.mousemoveevent = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10
vim.opt.autoread = true
vim.opt.title = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.list = true
vim.opt.listchars = {
  tab = "󰌒 ",
  trail = "·",
  lead = "·",
  extends = "»",
  precedes = "«",
  nbsp = "󱁐",
}
vim.opt.fillchars = {
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
  vim.opt.winborder = "rounded"
end

-- Treesitter folding. Neovim 0.13 can assign Lua functions directly to expr options.
vim.opt.foldmethod = "expr"
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
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
end
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
    },
  },
  virtual_text = false,
  virtual_lines = {
    current_line = true,
    overflow = "wrap",
  },
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
})
