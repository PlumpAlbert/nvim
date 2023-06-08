local M = {}

vim.list_extend(M, require'plugins.servers.lsp')
vim.list_extend(M, require'plugins.servers.null')

return M
