return {
  'echasnovski/mini.pairs',
  'echasnovski/mini.comment',
  'echasnovski/mini.surround',
  { "cshuaimin/ssr.nvim",
    config = function()
      require "ssr".setup {
        min_width = 30,
        min_height = 5,
        max_width = 70,
        max_height = 12,
        keymaps = {
          close = 'q',
          next_match = 'n',
          prev_match = 'N',
          replace_confirm = '<cr>',
          replace_all = '<leader><cr>',
        }
      }
    end
  },
}
