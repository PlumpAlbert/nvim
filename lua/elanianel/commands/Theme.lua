-- vim:ft=lua:ts=4:sw=0
local themes = {
    'gruvbox',
    'catppuccin',
    'github',
    'everforest',
    'moonfly',
}
local themes_dir = 'elanianel.config.themes.'

vim.api.nvim_create_user_command('Theme', function()
    local theme_id = math.random(1, #themes)
    require(themes_dir .. themes[theme_id])
end, {})
