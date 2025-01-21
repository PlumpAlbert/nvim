vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.showmode = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = {
  tab = '-->',
  trail = '␣',
  nbsp = '␣',
  space = '·',
}

vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 3

--#region Keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set({ 'n', 'v' }, 'Y', '"+y')
--#endregion

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight yanked text',
  group = vim.api.nvim_create_augroup('plumpvim-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--#region Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    { import = 'plumpvim.plugins' },
  },
  install = { colorscheme = { 'retrobox', 'habamax', 'default' } },
  checker = { enabled = false },
  change_detection = { enabled = false },
  defaults = {
    lazy = true,
    config = true,
  },
  lockfile = vim.fn.stdpath 'cache' .. '/lazy-lock.json',
  ui = {
    size = { width = 1, height = 1 },
    border = 'none',
    wrap = false,
    backdrop = 0,
  },
}
--#endregion
