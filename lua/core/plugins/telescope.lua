return {
    { 'nvim-telescope/telescope.nvim',
        lazy = true,
        version = '0.1.x',
        name = 'telescope',
        opts = function(_, opts)
          return vim.tbl_extend('force', require "core.config.telescope", opts)
        end
    },
    { 'nvim-telescope/telescope-project.nvim',
        dependencies = { 'telescope' },
        keys = {
            { '<leader>sp', "<cmd>Telescope project<CR>", desc = "Search projects" }
        },
        config = function()
          require 'telescope'.load_extension('project')
        end
    },
}
