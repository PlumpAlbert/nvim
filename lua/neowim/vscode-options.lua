if vim.g.vscode then
	local vs = require('vscode-neovim')

	--#region vscode-ui
	vim.api.nvim_exec([[
    " THEME CHANGER
    function! SetCursorLineNrColorInsert(mode)
        " Insert mode: blue
        if a:mode == "i"
            call VSCodeNotify('nvim-theme.insert')

        " Replace mode: red
        elseif a:mode == "r"
            call VSCodeNotify('nvim-theme.replace')
        endif
    endfunction

    augroup CursorLineNrColorSwap
        autocmd!
        autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
        autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
        autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
        autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
        autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
        autocmd ModeChanged [vV\x16]*:* call VSCodeNotify('nvim-theme.normal')
    augroup END
]], false)
	--#endregion

	--#region folding
	vim.keymap.set('n', 'zm', function ()
		vs.call('editor.foldAll')
	end)

	vim.keymap.set('n', 'zM', function ()
		vs.call('editor.foldAll')
	end)

	vim.keymap.set('n', 'zr', function ()
		vs.call('editor.unfoldAll')
	end)

	vim.keymap.set('n', 'zR', function ()
		vs.call('editor.unfoldAll')
	end)

	vim.keymap.set('n', 'zc', function ()
		vs.call('editor.fold')
	end)

	vim.keymap.set('n', 'zo', function ()
		vs.call('editor.unfold')
	end)
	--#endregion folding

	vim.keymap.set({'n','v','x'}, 'j', function ()
		vs.call('cursorDown')
	end)

	vim.keymap.set({'n','v','x'}, 'k', function ()
		vs.call('cursorUp')
	end)
end
