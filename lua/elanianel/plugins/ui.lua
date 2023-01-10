return {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
  "lewis6991/gitsigns.nvim",
  "stevearc/dressing.nvim",
  "ahmedkhalf/project.nvim",
  { 'nvim-telescope/telescope.nvim', version = '0.1.x' },
  { "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = 'v2.x',
    dependecies = {
      'plenary',
      'nvim-web-devicons',
      'nui'
    }
  }
}
