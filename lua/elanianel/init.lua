require "elanianel.core"
require "elanianel.lazy"
require "elanianel.config"
require "elanianel.keys"

if vim.fn.has('win32') == 1 then
  require 'elanianel.windows'
end
if vim.g.neovide ~= nil then
  require 'elanianel.neovide'
end

vim.cmd.colorscheme 'catppuccin'
