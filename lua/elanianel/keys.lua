-- vim:ft=lua:ts=4:sw=0:et:foldlevel=9999
vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require 'which-key'
wk.setup {
    presets = {
        g = true,
        text_objects = false,
    },
    triggers_blacklist = {
        v = { 's' }
    },
    disable = {
        filetypes = { "TelescopePrompt" }
    }
}

-- leader
wk.register({
    L = {
        name = 'Lazy',
        i = {
            function() vim.cmd.Lazy 'install' end,
            'Install plugins'
        },
        u = {
            function() vim.cmd.Lazy 'update' end,
            'Update plugins'
        },
        s = {
            function() vim.cmd.Lazy 'sync' end,
            'Sync plugins'
        },
        x = {
            function() vim.cmd.Lazy 'clean' end,
            'Clean plugins'
        },
        c = {
            function() vim.cmd.Lazy 'check' end,
            'Check plugins'
        },
    },
    c = { vim.cmd.BufferClose, 'Close buffer' },
    d = {
        name = "Debug",
        R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
        E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
        C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
        U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
        b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
        g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
        h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
        S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
        q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
        s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
        t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
        u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    },
}, { prefix = '<leader>' })

-- global
wk.register({
    ['<M-h>'] = {
        function() require 'bufferline.api'.goto_buffer_relative( -1) end,
        'Go to previous buffer'
    },
    ['<M-l>'] = {
        function() require 'bufferline.api'.goto_buffer_relative(1) end,
        'Go to next buffer'
    },
})
