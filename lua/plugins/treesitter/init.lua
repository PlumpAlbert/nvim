-- vim:ft=lua:ts=2:sw=0:et
local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local default = {
  auto_install = true,
  ensure_installed = {
    "lua",
    "vim",
    "bash",
    "javascript",
    "typescript",
    "jsdoc",
  },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 5000,
  }
}

ts_config.setup(default)

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    if vim.bo.filetype == 'scss' then
      vim.opt.foldmethod = 'syntax'
      vim.bo.syntax = 'on'
      return
    end
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
  end
})

require("nvim-ts-autotag").setup()
require("treesitter-context").setup {
  enable = true,
  trim_scope = 'outer',
}