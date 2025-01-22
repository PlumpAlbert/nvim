return {
  {
    'echasnovski/mini.pairs',
    version = '*',
    event = { 'BufEnter' },
    opts = {},
  },
  {
    'echasnovski/mini.surround',
    version = '*',
    event = { 'BufEnter' },
    opts = {
      mappings = {
        add = 'gza', -- Add surrounding in Normal and Visual modes
        delete = 'gzd', -- Delete surrounding
        find = 'gzf', -- Find surrounding (to the right)
        find_left = 'gzF', -- Find surrounding (to the left)
        highlight = 'gzh', -- Highlight surrounding
        replace = 'gzr', -- Replace surrounding
        update_n_lines = 'gzn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
      n_lines = 20,
      respect_selection_type = false,
      search_method = 'cover_or_nearest',
      silent = true,
    },
  },
  {
    'echasnovski/mini.files',
    version = '*',
    lazy = false,
    opts = {
      options = {
        permanent_delete = false,
        use_as_default_explorer = true,
      },
      windows = {
        max_number = 3,
        preview = false,
        width_focus = 50,
        width_nofocus = 10,
        width_preview = 25,
      },
      mappings = {
        go_in = '',
        go_in_plus = 'l',
      },
    },
    keys = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          local bufnr = args.data.buf_id

          local function rhs(direction)
            local cur_target = MiniFiles.get_explorer_state().target_window
            local new_target = vim.api.nvim_win_call(cur_target, function()
              vim.cmd(direction .. ' split')
              return vim.api.nvim_get_current_win()
            end)

            MiniFiles.set_target_window(new_target)
            MiniFiles.go_in { close_on_file = true }
          end

          vim.keymap.set('n', '<C-v>', function()
            rhs 'belowright vertical'
          end, { desc = 'Split vertically', buffer = bufnr })

          vim.keymap.set('n', '<C-s>', function()
            rhs 'belowright horizontal'
          end, { desc = 'Split horizontally', buffer = bufnr })
        end,
      })
      return {
        {
          '<leader>e',
          function()
            if not MiniFiles.close() then
              MiniFiles.open()
            end
          end,
          desc = 'Open file',
        },
      }
    end,
  },
  {
    'echasnovski/mini.icons',
    version = '*',
    lazy = false,
    config = function()
      require('mini.icons').setup { style = 'glyph' }
      MiniIcons.mock_nvim_web_devicons()
    end,
  },
  {
    'echasnovski/mini.notify',
    version = '*',
    lazy = false,
    config = function()
      require('mini.notify').setup {
        lsp_progress = { enable = false },
      }

      vim.notify = MiniNotify.make_notify()
    end,
  },
  {
    'echasnovski/mini.statusline',
    event = 'VeryLazy',
    opts = {
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
          local git = MiniStatusline.section_git { trunc_width = 40 }
          local filename = MiniStatusline.section_filename { trunc_width = 30 }
          local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 30 }

          return MiniStatusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineDevinfo', strings = { git } },
            '%<',
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=',
            { hl = mode_hl, strings = { fileinfo } },
          }
        end,
        inactive = nil,
      },
    },
  },
}
