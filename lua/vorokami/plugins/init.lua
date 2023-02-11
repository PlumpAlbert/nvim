local M = {
    { 'Mofiqul/vscode.nvim',
        opts = {
            -- Enable transparent background
            transparent = true,
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
    { "leoluz/nvim-dap-go",
        dependencies = { 'mfussenegger/nvim-dap' },
        ft = { 'go' },
        opts = {
            dap_configurations = {
                {
                    -- Must be "go" or it will be ignored by the plugin
                    type = "go",
                    name = "Attach remote",
                    mode = "remote",
                    request = "attach",
                },
            },
            -- delve configurations
            delve = {
                -- time to wait for delve to initialize the debug session.
                -- default to 20 seconds
                initialize_timeout_sec = 20,
                -- a string that defines the port to start delve debugger.
                -- default to string "${port}" which instructs nvim-dap
                -- to start the process in a random available port
                port = "${port}"
            },
        }
    },
    { 'jay-babu/mason-nvim-dap.nvim', opts = {
        ensure_installed = { 'delve' }
    } }
}

return M
