return {
    numhl = true,
    linehl = false,
    word_diff = false,
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    max_file_length = 1000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
}
