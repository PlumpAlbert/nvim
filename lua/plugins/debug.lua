return {
    {
        'mfussenegger/nvim-dap',
        keys = {
            {
                '<leader>dt',
                function()
                    require 'dap'.toggle_breakpoint()
                end,
                desc = "Toggle breakpoint"
            },
            {
                '<leader>ds',
                function()
                    require 'dap'.continue()
                end,
                desc = 'Start debugging'
            },
        }
    },
    {
        'rcarriga/nvim-dap-ui',
        event = 'BufEnter',
        dependencies = { 'mfussenegger/nvim-dap' },
        config = function()
            require'_core.lsp.dap-ui'
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = { 'mfussenegger/nvim-dap' },
        event = 'BufEnter',
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = { 'williamboman/mason.nvim', 'mfussenegger/nvim-dap' },
        event = 'BufEnter',
        opts = function(_, opts)
            return vim.tbl_extend('force', {
                automatic_installation = true,
                automatic_setup = true
            }, opts)
        end
    },
}
