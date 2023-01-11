vim.g.neovide_fullscreen              = false
vim.g.neovide_remember_window_size    = true
vim.g.neovide_confirm_quit            = true
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_transparency            = 0.96

require 'which-key'.register {
  ['<C-S-v>'] = { '"+p', 'Paste', mode = { 'n', 'x' } },
  ['<C-S-v>'] = { '<Esc>"+P', 'Paste', mode = { 'i' } },
}

