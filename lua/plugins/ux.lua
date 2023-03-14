return {
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  {
    "kkoomen/vim-doge",
    build = ":call doge#install()",
    keys = {
      { "<leader>d", "<cmd>DogeGenerate<CR>", desc = "Generate documentation" },
    },
    cmd = "DogeGenerate",
  },
  {
    "klen/nvim-config-local",
    event = "VimEnter",
    config = function()
      require("config-local").setup({
        config_files = { ".vimrc.lua", ".vimrc" }, -- Config file patterns to load (lua supported)
        hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
        autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
        silent = true, -- Disable plugin messages (Config loaded/ignored)
        lookup_parents = false, -- Lookup config files in parent directories
      })
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
}
