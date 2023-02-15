local utils = require "core.lazy.util"

local java = require 'java'
local js = require 'javascript'
local golang = require 'golang'

local plugins = vim.tbl_flatten({
  java.plugins,
  js.plugins,
  golang.plugins
})
require "core".setup(plugins)

vim.cmd.colorscheme 'nordic'
