-- core
local utils = require "core.lazy.util"
-- languages
local languages = {
    require 'java',
    require 'javascript',
    require 'golang',
}

local plugins = {}
for _, lang in ipairs(languages) do
    plugins = utils.concat(plugins, lang.plugins)
end
require "core".setup(plugins)

for _, lang in ipairs(languages) do
    lang.setup()
end

local ok, vscode = pcall(require, 'vscode')
if not ok then
    return
end

local c = require "vscode.colors".get_colors()
vscode.setup {
    transparent = true,
    italic_comments = true,
    group_overrides = {
        Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
    }
}
