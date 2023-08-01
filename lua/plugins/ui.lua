return {
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            show_current_context_start = true,
            show_end_of_line = true,
            space_char_blankline = " ",
        },
    },

    {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        event = "VeryLazy",
        opts = {
            hint = "floating-big-letter",

            highlights = {
                statusline = {
                    focused = {
                        fg = "#ededed",
                        bg = "#e35e4f",
                        bold = true,
                    },
                    unfocused = {
                        fg = "#ededed",
                        bg = "#44cc41",
                        bold = true,
                    },
                },
                winbar = {
                    focused = {
                        fg = "#ededed",
                        bg = "#e35e4f",
                        bold = true,
                    },
                    unfocused = {
                        fg = "#ededed",
                        bg = "#44cc41",
                        bold = true,
                    },
                },
            },
        },
    },

    {
        "NvChad/nvim-colorizer.lua",
        event = "VeryLazy",
        opts = function()
            local config = {
                css = true,
                tailwind = true,
            }

            return {
                filetypes = {
                    "*",
                    javascriptreact = config,
                    typescriptreact = config,
                    css = config,
                    scss = config,
                    sass = config,
                    html = config,
                },
                user_default_options = {
                    mode = "virtualtext",
                    sass = { enable = true, parsers = { "css" } },
                },
            }
        end,
    },
}
