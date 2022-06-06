let g:neovide_refresh_rate=120
let g:neovide_no_idle=v:true
let g:neovide_transparency=0.9
let g:neovide_remember_window_size = v:true
let g:neovide_cursor_vfx_mode = "pixiedust"

set guifont=monospace,emoji:h10
if has('win32')
	set guifont=ComicCodeLigatures_NF,Symbols_Nerd_Font,Segoe_Fluent_Icons,Segoe_UI_Emoji:h10
endif
colorscheme base16-oceanicnext
