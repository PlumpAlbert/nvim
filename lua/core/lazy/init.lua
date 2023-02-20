local utils = require "core.lazy.util"

-- installing lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local M = {}

---@param plugins table
M.setup = function(plugins)
    local core_plugins = require "core.plugins"
    require "lazy".setup(
        utils.concat(core_plugins, plugins or {}),
        {
            defaults = {
                lazy = true,
            },
            install = {
                missing = true,
                colorscheme = { 'nordic', 'habamax' }
            },
            change_detection = {
                enabled = true,
                notify = false,
            }
        }
    )
end

return M
