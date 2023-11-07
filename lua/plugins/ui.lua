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
            filter_rules = {
                bo = {
                    filetype = { "neo-tree", "notify" },
                    buftype = { "terminal" },
                },
            },

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

    {
        "narutoxy/silicon.lua",
        config = true,
        keys = {
            {
                "<leader>cs",
                function()
                    require("silicon").visualise_api({
                        to_clip = true,
                        show_buf = true,
                    })
                end,
                mode = "n",
                desc = "Code snapshot",
            },
            {
                "<leader>cs",
                function()
                    require("silicon").visualise_api({ to_clip = true })
                end,
                mode = "v",
                desc = "Code snapshot",
            },
        },
        opts = {
            theme = "Visual Studio Dark+",
            output = "${year}-${month}-${date}_${time}.png", -- auto generate file name based on time (absolute or relative to cwd)
            bgColor = vim.g.terminal_color_4,
            bgImage = "", -- path to image, must be png
            roundCorner = true,
            windowControls = true,
            lineNumber = true,
            font = "monospace",
            lineOffset = 1, -- from where to start line number
            linePad = 0, -- padding between lines
            padHoriz = 64, -- Horizontal padding
            padVert = 32, -- vertical padding
            shadowBlurRadius = 10,
            shadowColor = "#1a1a1a",
            shadowOffsetX = 8,
            shadowOffsetY = 8,
            gobble = true, -- enable lsautogobble like feature
            debug = false, -- enable debug output
        },
    },
}
