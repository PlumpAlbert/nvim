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

local themes = { 'gruvbox', 'palenightfall', 'catppuccin', 'github' }

local themes_dir = 'elanianel.config.themes.'

local theme_id = math.random(1, #themes)
require(themes_dir .. themes[theme_id]) 

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
