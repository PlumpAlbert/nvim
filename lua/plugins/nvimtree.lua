-- vim:ft=lua:ts=2:sw=0
local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local default = {
  actions = {
    open_file = {
      window_picker = {
        exclude = {
          filetype = { "notify", "packer", "qf" },
          buftype = { "terminal" },
        },
      },
    },
  },
  -- Change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
  respect_buf_cwd = true,
  disable_netrw = false,
  hijack_netrw = true,
  ignore_ft_on_setup = { "dashboard" },
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    adaptive_size = true,
    side = "right",
    width = 25,
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = {
        { key = ".", action = "toggle_dotfiles" },
      },
    },
  },
  git = {
    enable = true,
    ignore = true,
  },
  filters = {
    dotfiles = true,
    exclude = {
      '.git/'
    },
  },
  renderer = {
    add_trailing = true,
    highlight_git = true,
    highlight_opened_files = 'icon',
    root_folder_modifier = table.concat {
      ":t:gs?$?/..",
      string.rep(" ", 1000),
      "?:gs?^??"
    },
    indent_markers = {
      enable = true,
      icons = {
        corner = '└',
        edge = '',
        none = '',
        item = '│',
      }
    },
    icons = {
      git_placement = 'after',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          deleted = "",
          ignored = "",
          renamed = "",
          staged = "",
          unmerged = "",
          unstaged = "",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      }
    }
  }
}

nvimtree.setup(default)
