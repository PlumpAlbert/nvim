return {
    theme = 'vscode',
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename' },
        lualine_x = {
            {
                require 'lazy.status'.updates,
                cond = require 'lazy.status'.has_updates,
                color = { fg = '#ff9e64' }
            },
        },
        lualine_y = { 'diagnostics', 'filetype' },
        lualine_z = {},
    },
    extensions = {
        'neo-tree',
    },
}
