return {
    {
        "leoluz/nvim-dap-go",
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
    {
        'jay-babu/mason-nvim-dap.nvim',
        opts = {
            ensure_installed = { 'delve' }
        }
    }
}
