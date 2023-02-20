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

vim.cmd.colorscheme 'base16-tomorrow-night'
