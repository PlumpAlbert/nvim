-- vim:ft=lua:ts=2:sw=0
local present, telescope = pcall(require, "telescope")

if not present then
  return
end
local actions = require 'telescope.actions'

local default = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      preview_cutoff = 100,
      horizontal = {
        preview_width = function(_, cols, _)
          if cols < 100 then
            return math.floor(cols * 0.5)
          end
          return math.floor(cols * 0.6)
        end,
        mirror = false,
      },
      vertical = { mirror = false },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-c>'] = actions.close,
      }
    },
    file_ignore_patterns = {
      "node_modules",
      "vendor",
      "build",
      ".venv",
      ".git"
    },
    path_display = { "truncate", shorten = 5 },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
    live_grep = {
      only_sort_text = true
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
}

telescope.setup(default)
