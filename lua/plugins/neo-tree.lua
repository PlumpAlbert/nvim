local function current_file_or_cwd()
  local current_file = vim.fn.expand("%:p")
  if current_file ~= "" and vim.fn.filereadable(current_file) == 1 then
    return current_file
  end
  return vim.fn.getcwd()
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    cond = not vim.g.vscode,
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({
            action = "focus",
            source = "filesystem",
            position = "float",
          })
        end,
        desc = "Open file explorer",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({
            action = "focus",
            source = "filesystem",
            position = "float",
            reveal_file = current_file_or_cwd(),
            reveal_force_cwd = true,
            toggle = true,
          })
        end,
        desc = "Reveal current file in explorer",
      },
      {
        "<leader>.",
        function()
          require("neo-tree.command").execute({
            action = "focus",
            source = "buffers",
            position = "float",
          })
        end,
        desc = "View open buffers",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.nvim",
      {
        "s1n7ax/nvim-window-picker",
        name = "window-picker",
        version = "2.*",
        config = true,
        opts = {
          hint = "statusline-winbar",
          picker_config = {
            statusline_winbar_picker = { use_winbar = "smart" },
          },
          filter_rules = {
            autoselect_one = true,
            include_current_win = false,
            bo = {
              filetype = { "neo-tree", "neo-tree-group", "notify" },
              buftype = { "terminal", "quickfix" },
            },
          },
        },
      },
    },
    opts = {
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = false,
      sort_case_insensitive = true,
      open_files_do_not_replace_types = {
        "terminal",
        "trouble",
        "qf",
      },
      default_component_configs = {
        git_status = {
          added = "",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
      window = {
        position = "float",
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      filesystem = {
        follow_current_file = {
          leave_dirs_open = false,
        },
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_hidden = false,
          hide_by_name = {
            ".venv",
            "node_modules",
            ".git",
          },
          always_show = {
            ".gitignore",
          },
        },
      },
    },
  },
}
