require "core.options"
require "core.highlights"

if vim.fn.has('win32') == 1 then
  require 'core.windows'
end

if vim.g.neovide ~= nil then
  require 'core.neovide'
end

return require "core.lazy"
