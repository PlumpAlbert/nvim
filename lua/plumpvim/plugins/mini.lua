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
        max_number = math.huge,
        preview = false,
        width_focus = 50,
        width_nofocus = 10,
        width_preview = 25,
      },
    },
    keys = {
      {
        '<leader>e',
        function()
          MiniFiles.open()
        end,
        desc = 'Open file',
      },
    },
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
}
