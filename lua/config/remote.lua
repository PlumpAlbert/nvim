local M = {}

M.is_ssh = vim.env.SSH_TTY ~= nil or vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil
M.is_tmux = vim.env.TMUX ~= nil
M.is_remote_like = M.is_ssh or M.is_tmux

if M.is_remote_like then
  -- Reliable clipboard inside SSH/tmux. Requires terminal/tmux OSC52 support.
  -- Must be set before clipboard provider initialization.
  vim.g.clipboard = "osc52"

  -- Keep startup snappy on remote machines unless these providers are explicitly needed.
  vim.g.loaded_node_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_ruby_provider = 0
end

return M
