return {
    popup_border_style = "rounded",
    window = {
        position = 'right',
        width = 25,
    },
    filesystem = {
        follow_current_file = true,
        group_empty_dirs = false,
        filtered_items = {
            hide_gitignored = true,
            always_show = {
                ".gitignore",
                ".github",
                ".env",
                ".env.local"
            },
        },
    },
}
