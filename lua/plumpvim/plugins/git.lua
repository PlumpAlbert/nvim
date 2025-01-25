return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufEnter' },
    opts = {
      attach_to_untracked = true,
      signcolumn = true,
      signs = {
        untracked = { text = '▐' },
        add = { text = '▐' },
        change = { text = '▐' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      current_line_blame = true,
      current_line_blame_formatter = '<author> 󰁥 <summary>',
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 300,
        ignore_whitespace = true,
        virt_text_priority = 100,
        use_focus = true,
      },
      on_attach = function(bufnr)
        local gs = require 'gitsigns'

        local function map(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        map('n', '<leader>gb', function()
          gs.blame_line { full = true }
        end, { desc = '[Git] Blame line' })

        map('n', '<leader>gp', gs.preview_hunk, { desc = '[Git] Preview changes' })

        map('n', ']c', function()
          gs.nav_hunk 'next'
        end, { desc = '[Git] Next hunk' })

        map('n', '[c', function()
          gs.nav_hunk 'prev'
        end, { desc = '[Git] Previous hunk' })
      end,
    },
  },
}
