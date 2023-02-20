-- vim:ft=lua:ts=4:sw=0
local themes = {
    'gruvbox-material',
    'catppuccin-mocha',
    'github_dark',
    'everforest',
    'moonfly',
    'nordic'
}

vim.api.nvim_create_user_command('Theme', function()
    local theme_id = math.random(1, #themes)
    vim.cmd.colorscheme(themes[theme_id])
end, {})
