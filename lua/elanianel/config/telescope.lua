local telescope = require("telescope")
local builtin = require('telescope.builtin')
telescope.setup {
  prompt_prefix = " ",
  selection_caret = " ",
  entry_prefix = "  ",
  borderchars = {
    prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
    results = { " " },
    preview = { " " },
  }
}
telescope.load_extension("projects")

-- vim:ft=lua:ts=4:sw=0:et
