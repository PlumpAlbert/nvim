return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    event = "VeryLazy",
    opts = {
      winopts = { border = "rounded" },
      files = { git_icons = true, file_icons = true, prompt = "  " },
      grep = { prompt = "  " },
      buffers = { prompt = "󰈙  " },
      oldfiles = { prompt = "  " },
      helptags = { prompt = "󰋖  " },
      ui_select = {
        winopts = {
          height = 0.4,
          width = 0.5,
          border = "rounded",
        },
      },
    },
  },
}
