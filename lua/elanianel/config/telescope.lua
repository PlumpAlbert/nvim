local telescope = require("telescope")
telescope.setup {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    borderchars = {
        prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
        results = { " " },
        preview = { " " },
    },
}
telescope.load_extension("project")

-- vim:ft=lua:ts=4:sw=0:et
