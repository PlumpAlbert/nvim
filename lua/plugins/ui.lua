return {
    {
        'rcarriga/nvim-notify',
        ---@param opts notify.Config
        opts = function(_, opts)
            return vim.tbl_extend('force', opts, {
                level = vim.log.levels.WARN,
                timeout = 1000,
                top_down = false
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        keys = function()
            return {
                { '<leader>,',        '<cmd>Telescope buffers<CR>',               desc = 'Switch buffer' },
                { '<leader>/',        '<cmd>Telescope live_grep<CR>',             desc = 'Search word' },
                { '<leader><leader>', '<cmd>Telescope find_files<CR>',            desc = 'Search files' },
                { '<leader>f',        '<cmd>Telescope git_files<CR>',             desc = 'Search files (Git)' },
                { '<leader>sr',       '<cmd>Telescope resume<CR>',                desc = 'Resume telescope' },
                { '<leader>sk',       '<cmd>Telescope keymaps<CR>',               desc = 'Search keymaps' },
                { '<leader>ss',       '<cmd>Telescope lsp_document_symbols<CR>',  desc = 'Search symbols (document)' },
                { '<leader>sS',       '<cmd>Telescope lsp_workspace_symbols<CR>', desc = 'Search symbols (workspace)' },
                { '<leader>gl',       '<cmd>Telescope git_commits<CR>',           desc = 'View git log' },
                { '<leader>gb',       '<cmd>Telescope git_branches<CR>',          desc = 'View git branches' },
                { '<leader>ld',       '<cmd>Telescope diagnostics<CR>',           desc = 'View diagnostics' },
            }
        end
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        keys = function()
            return {
                { '<leader>e', '<cmd>Neotree float reveal_force_cwd<cr>', desc = 'Open file explorer' },
            }
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        opts = function()
            local defaults = {
                RGB = true,          -- #RGB hex codes
                RRGGBB = true,       -- #RRGGBB hex codes
                names = true,        -- "Name" codes like Blue
                RRGGBBAA = true,     -- #RRGGBBAA hex codes
                rgb_fn = true,       -- CSS rgb() and rgba() functions
                hsl_fn = true,       -- CSS hsl() and hsla() functions
                css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode = "background", -- Set the display mode.
            }

            return {
                    ['*'] = {},
                lua = vim.tbl_extend('force', defaults, { names = false }),
                css = defaults,
                scss = defaults,
                sass = defaults,
                less = defaults,
                html = defaults,
            }
        end
    },
    {
        's1n7ax/nvim-window-picker',
        opts = {
            autoselect_one = true,
            include_current_win = false,
            selection_chars = 'FJDKSLA;CMRUEIWOQP',
            -- whether you want to use winbar instead of the statusline
            use_winbar = 'smart', -- "always" | "never" | "smart"
            show_prompt = true,
            filter_rules = {
                -- filter using buffer options
                bo = {
                    -- if the file type is one of following, the window will be ignored
                    filetype = { 'NvimTree', "neo-tree", "notify" },
                    -- if the buffer type is one of following, the window will be ignored
                    buftype = { 'terminal' },
                },
                -- filter using window options
                wo = {},
                file_path_contains = {},
                file_name_contains = {},
            },
            fg_color = '#ededed',
            other_win_hl_color = '#44cc4166',
            -- You can change the display string in status bar.
            -- It supports '%' printf style. Such as `return char .. ': %f'` to display
            -- buffer filepath. See :h 'stl' for details.
            selection_display = function(char) return char end,
        }
    },
    {
        'folke/which-key.nvim',
        config = function()
            local wk = require 'which-key'
            wk.register({
                mode = { "n", "v" },
                    ["g"] = { name = "+goto" },
                    ["gz"] = { name = "+surround" },
                    ["]"] = { name = "+next" },
                    ["["] = { name = "+prev" },
                    ["<leader><tab>"] = { name = "+tabs" },
                    ["<leader>b"] = { name = "+buffer" },
                    ["<leader>l"] = { name = "+lsp" },
                    ["<leader>f"] = { name = "+file/find" },
                    ["<leader>g"] = { name = "+git", h = { name = "+hunks" } },
                    ["<leader>q"] = { name = "+quit/session" },
                    ["<leader>s"] = { name = "+search", n = { name = "+noice" } },
                    ["<leader>u"] = { name = "+ui" },
                    ["<leader>w"] = { name = "+windows" },
                    ["<leader>x"] = { name = "+diagnostics/quickfix" },
                    ["<leader>L"] = { "<cmd>Lazy<cr>", "Lazy", }
            })
        end
    }
}
