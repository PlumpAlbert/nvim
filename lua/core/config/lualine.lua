return {
  theme = 'auto',
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {
      {
        require 'lazy.status'.updates,
        cond = require 'lazy.status'.has_updates,
        color = { fg = '#ff9e64' }
      }
    },
    lualine_z = { 'diagnostics', 'filetype' },
  },
  extensions = {
    'neo-tree',
  },
}
