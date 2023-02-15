vim.fn.mkdir(vim.fn.stdpath('data') .. '/eclipse', 'p')

vim.fn.system({
  'curl',
  '-L',
  'https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml',
  '-o',
  vim.fn.stdpath('data') .. '/eclipse/eclipse-java-google-style.xml'
})

local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

lsp.configure('lemminx', {})
lsp.skip_server_setup({ 'jdtls' })
