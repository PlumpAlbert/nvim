return {
    { 'mfussenegger/nvim-dap',
        keys = {
            { '<leader>dt', function()
              require 'dap'.toggle_breakpoint()
            end, desc = "Toggle breakpoint" },
            { '<leader>ds', function()
              require 'dap'.continue()
            end, desc = 'Start debugging' },
        }
    },
    { 'rcarriga/nvim-dap-ui',
        event = 'BufEnter',
        dependencies = { 'mfussenegger/nvim-dap' },
        config = function()
          local ui = require "dapui"
          local dap = require "dap"

          ui.setup()

          dap.listeners.after.event_initialized["dapui_config"] = function()
            ui.open()
            vim.keymap.set('n', '<F5>', function()
              require 'dap'.terminate()
            end, { desc = 'Stop debugging' })

            vim.keymap.set('n', '<F8>', function()
              require 'dap'.continue({})
            end, { desc = 'Continue' })

            vim.keymap.set('n', '<F9>', function()
              require 'dap'.step_back()
            end, { desc = 'Step back' })

            vim.keymap.set('n', '<F10>', function()
              require 'dap'.step_over()
            end, { desc = 'Step over' })

            vim.keymap.set('n', '<F11>', function()
              require 'dap'.step_over()
            end, { desc = 'Step into' })

            vim.keymap.set('n', '<C-k>', function()
              require 'dap.ui.widgets'.hover()
            end, { desc = 'Hover value' })
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            vim.keymap.del('n', '<F5>')
            vim.keymap.del('n', '<F8>')
            vim.keymap.del('n', '<F9>')
            vim.keymap.del('n', '<F10>')
            vim.keymap.del('n', '<F11>')
            vim.keymap.del('n', '<C-k>')
            ui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            vim.keymap.del('n', '<F5>')
            vim.keymap.del('n', '<F8>')
            vim.keymap.del('n', '<F9>')
            vim.keymap.del('n', '<F10>')
            vim.keymap.del('n', '<F11>')
            vim.keymap.del('n', '<C-k>')
            ui.close()
          end
        end
    },
    { 'theHamsta/nvim-dap-virtual-text',
        dependencies = { 'mfussenegger/nvim-dap' },
        event = 'BufEnter',
    },
    { 'jay-babu/mason-nvim-dap.nvim',
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
