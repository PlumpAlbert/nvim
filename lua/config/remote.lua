local M = {}

M.is_ssh = vim.env.SSH_TTY ~= nil or vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil

if vim.g.vscode and vim.g.vscode_clipboard then
  vim.g.clipboard = vim.g.vscode_clipboard
end

if M.is_ssh then
  -- Reliable clipboard over SSH. Requires terminal OSC52 support.
  -- Must be set before clipboard provider initialization.
  if not (vim.g.vscode and vim.g.vscode_clipboard) then
    vim.g.clipboard = "osc52"
  end

  -- Keep startup snappy on remote machines unless these providers are explicitly needed.
  vim.g.loaded_node_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_ruby_provider = 0
end

return M
