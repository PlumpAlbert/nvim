require "core".setup(require "javascript.plugins")
require "javascript.commands"
require "javascript.config.lsp"

local current_hour = tonumber(os.date("%H"))
if current_hour > 8 and current_hour < 17 then
  vim.cmd.colorscheme "github_light"
else
  vim.cmd.colorscheme "nordic"
end
