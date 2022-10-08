let g:neovide_refresh_rate=60
let g:neovide_no_idle=v:true
let g:neovide_transparency=0.95
let g:neovide_remember_window_size = v:true
let g:neovide_hide_mouse_when_typing = v:true
let g:neovide_cursor_animation_length = 0.1
let g:neovide_cursor_trail_size = 0.4
let g:neovide_cursor_antialising = v:true
let g:neovide_cursor_vfx_mode = "pixiedust"

set guifont=monospace,emoji:h10
if has('win32')
  set guifont=JetBrainsMono_NF,Symbols_Nerd_Font,Segoe_Fluent_Icons,Segoe_UI_Emoji:h11.5
endif
" vim:ts=2:sw=0:et
