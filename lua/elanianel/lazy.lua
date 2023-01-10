-- vim:ft=lua:ts=4:sw=0:et
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

require"lazy".setup('elanianel.plugins', {
    defaults = {
        lazy = true
    },
    install = {
        missing = true,
        colorscheme = { 'catppuccin', 'habamax' }
    },
    change_detection = {
        enabled = true,
        notify = false,
    }
})
