return {
    { "folke/which-key.nvim",
        lazy = false,
        config = function(_, keys)
            local wk = require "core.config.which_key"
            if keys ~= nil then
                wk.register(keys)
            end
        end
    },
    { 'echasnovski/mini.pairs',
        lazy = false,
        config = function(_, opts)
            require "mini.pairs".setup(opts)
        end
    },
    { 'echasnovski/mini.comment',
        lazy = false,
        config = function(_, opts)
            require "mini.comment".setup(opts)
        end
    },
    { 'echasnovski/mini.surround',
        lazy = false,
        opts = {
            mappings = {
                add = '<leader>ya', -- Add surrounding in Normal and Visual modes
                delete = '<leader>yd', -- Delete surrounding
                replace = '<leader>yc', -- Replace surrounding
                find = '', -- Find surrounding (to the right)
                find_left = '', -- Find surrounding (to the left)
                highlight = '', -- Highlight surrounding
                update_n_lines = '', -- Update `n_lines`
                suffix_last = '', -- Suffix to search with "prev" method
                suffix_next = '', -- Suffix to search with "next" method
            },
        },
        config = function(_, opts)
            require "mini.surround".setup(opts)
        end
    },
    { "windwp/nvim-spectre",
        keys = {
            { '<leader>R',
                function()
                    require "spectre".open_visual { select_word = true }
                end,
                desc = "Find and replace",
                mode = { "n", "x" }
            },
        },
        opts = {
            min_width = 30,
            min_height = 5,
            max_width = 70,
            max_height = 12,
            keymaps = {
                close = 'q',
                next_match = 'n',
                prev_match = 'N',
                replace_confirm = '<cr>',
                replace_all = '<leader><cr>',
            }
        }
    },
    { "klen/nvim-config-local",
        event = "VimEnter",
        config = function()
            require('config-local').setup {
                config_files = { ".vimrc.lua", ".vimrc" }, -- Config file patterns to load (lua supported)
                hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
                autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
                commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
                silent = false, -- Disable plugin messages (Config loaded/ignored)
                lookup_parents = false, -- Lookup config files in parent directories
            }
        end
    },
    { "wakatime/vim-wakatime", event = "VeryLazy" }
}
