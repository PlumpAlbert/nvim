require "core".setup(require "java.plugins")

vim.fn.mkdir(vim.fn.stdpath('data') .. '/eclipse', 'p')

vim.fn.system({
  'curl',
  '-L',
  'https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml',
  '-o',
  vim.fn.stdpath('data') .. '/eclipse/eclipse-java-google-style.xml'
})

local lsp = require "lsp-zero"

lsp.configure('lemminx', {})
