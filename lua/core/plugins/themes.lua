return {
    { 'projekt0n/github-nvim-theme',
        branch = '0.0.x',
        event = "ColorScheme",
    },
    { 'bluz71/vim-moonfly-colors',
        name = 'moonfly',
        event = "ColorScheme",
        priority = 1000,
        config = function()
          vim.g.moonflyWinSeparator = 2
        end
    },
    { "andersevenrud/nordic.nvim",
        event = "ColorScheme",
        config = function()
          vim.g.nord_underline_option = 'undercurl'
          vim.g.nord_italic = false
          vim.g.nord_italic_comments = false
          vim.g.nord_minimal_mode = false
          vim.g.nord_alternate_backgrounds = true
        end
    },
}
