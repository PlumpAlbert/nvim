require "core".setup(require "elanianel.plugins")
require "elanianel.commands"
require "elanianel.config.lsp"

local current_hour = tonumber(os.date("%H"))
if current_hour > 8 or current_hour < 17 then
  require 'elanianel.config.themes.github'
else
  require 'elanianel.config.themes.moonfly'
end
