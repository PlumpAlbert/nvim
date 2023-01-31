-- vim:ft=lua:ts=4:sw=0:et:foldlevel=9999
vim.o.timeout = true
vim.o.timeoutlen = 300

local presets = require 'which-key.plugins.presets'
presets.operators['zM'] = nil
presets.operators['zR'] = nil

local wk = require 'which-key'
wk.setup {
    presets = {
        g = false,
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
    e = { vim.cmd.NeoTreeFloatToggle, 'NeoTree', },
    l = {
        name = 'LSP',
        j = { vim.diagnostic.goto_next, 'Next diagnostic' },
        k = { vim.diagnostic.goto_prev, 'Previous diagnostic' },
        a = { vim.lsp.buf.code_action, 'Code actions' },
        r = { vim.lsp.buf.rename, 'Rename symbol' },
        f = {
            function()
                vim.lsp.buf.format {
                    filter = function(client)
                        return client.name ~= 'tsserver'
                    end
                }
            end,
            'Format document',
            mode = { 'n', 'v' }
        },
    },
    g = {
        name = 'Git',
        p = {
            function() vim.cmd.Gitsigns 'preview_hunk' end,
            'Preview hunk'
        },
        s = {
            function() vim.cmd.Gitsigns 'stage_hunk' end,
            'Stage hunk',
            mode = { 'v', 'n' }
        },
        v = {
            function() vim.cmd.Gitsigns 'select_hunk' end,
            'Select hunk',
        }
    },
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
    s = {
        name = 'Telescope',
        f = { require 'telescope.builtin'.find_files, 'Find files in CWD' },
        t = { require 'telescope.builtin'.live_grep, 'Search text' },
        p = {
            require 'telescope'.extensions.project.project,
            'Find projects'
        },
    },
    f = { require 'telescope.builtin'.git_files, 'Find Git files' },
    r = { require 'ssr'.open, 'Find and replace', mode = { 'n', 'x' } },
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
    ['<C-h>'] = { vim.lsp.buf.signature_help, 'Signature help', mode = 'i' },
    K = { vim.lsp.buf.hover, 'Hover information' },
    [']c'] = { function() vim.cmd.Gitsigns 'next_hunk' end, 'Next hunk' },
    ['[c'] = { function() vim.cmd.Gitsigns 'prev_hunk' end, 'Previous hunk' },
    ['zM'] = { require 'ufo'.closeAllFolds, 'Close all folds' },
    ['zR'] = { require 'ufo'.openAllFolds, 'Open all folds' },
    ['<M-h>'] = {
        function() require 'bufferline.api'.goto_buffer_relative(-1) end,
        'Go to previous buffer'
    },
    ['<M-l>'] = {
        function() require 'bufferline.api'.goto_buffer_relative(1) end,
        'Go to next buffer'
    },
    g = {
        name = 'Go to',
        d = { vim.lsp.buf.definition, 'Go to definition' },
        i = { vim.lsp.buf.implementation, 'Go to implementation' },
        r = { vim.lsp.buf.references, 'List references' },
        t = { vim.lsp.buf.type_definition, 'Go to type definition' },
        D = { vim.lsp.buf.type_definition, 'Go to declaration' },
    },
})
