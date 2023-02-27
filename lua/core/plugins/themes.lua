return {
    { "RRethy/nvim-base16",      event = "ColorScheme" },
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
    { "catppuccin/nvim",
        name = "catppuccin",
        event = "ColorScheme",
        opts = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            show_end_of_buffer = false, -- show the '~' characters after the end of buffers
            term_colors = true,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                neotree = true,
                telescope = true,
                mini = true,
                barbar = true,
                mason = true,
                fidget = true,
                dap = {
                    enabled = true,
                    enable_ui = true,
                },
                ts_rainbow = true,
                which_key = true,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        }
    },
    { "sainnhe/everforest",
        event = "ColorScheme",
    },
    { 'savq/melange-nvim',
        event = "ColorScheme",
    },
    { 'sainnhe/gruvbox-material',
        event = "ColorScheme",
        config = function()
            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_better_performance = 1
        end
    },
    { 'JoosepAlviste/palenightfall.nvim',
        event = "ColorScheme",
    },
    { 'Mofiqul/vscode.nvim',
        opts = {
            -- Enable transparent background
            transparent = false,
            -- Enable italic comment
            italic_comments = true,
            -- Disable nvim-tree background color
            disable_nvimtree_bg = true,
            -- Override colors (see ./lua/vscode/colors.lua)
            color_overrides = {},
            -- Override highlight groups (see ./lua/vscode/theme.lua)
            group_overrides = {
                -- this supports the same val table as vim.api.nvim_set_hl
                -- use colors from this colorscheme by requiring vscode.colors!
            }
        }
    },
}
