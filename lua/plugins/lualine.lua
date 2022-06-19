-- vim:ft=lua:ts=4:sw=0
-- stylua: ignore
local colors = {
    black = '#282c34',
    red = '#e06c75',
    green = '#98c379',
    yellow = '#e5c07b',
    blue = '#61afef',
    magenta = '#c678dd',
    cyan = '#56b6c2',
    grey = '#abb2bf',
    white = '#ffffff',
}

local theme = {
    normal = {
        a = { fg = colors.black, bg = colors.magenta },
        b = { fg = colors.grey, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
        x = { fg = colors.white, bg = colors.black },
        y = { fg = colors.grey, bg = colors.black },
        z = { fg = colors.black, bg = colors.yellow },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

require('lualine').setup {
    options = {
        theme = theme,
        component_separators = { left = '  ', right = '  ' },
        section_separators = { left = ' ', right = ' ' },
        disabled_filetypes = {
            'TelescopePrompt',
            'NvimTree',
            'packer',
        },
    },
    sections = {
        lualine_a = {
            { 'mode' },
            { 'branch' }
        },
        lualine_b = {
            'filename',
            {
                'lsp_progress',
                display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
                spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
                colors = {
                    percentage      = colors.cyan,
                    title           = colors.cyan,
                    message         = colors.cyan,
                    spinner         = colors.cyan,
                    lsp_client_name = colors.magenta,
                    use             = true,
                },
            }
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            'filetype',
            'fileformat',
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { 'toggleterm', 'nvim-tree' },
}

vim.cmd "\
set laststatus=3\
hi WinSeparator ctermfg=none guifg=none"
