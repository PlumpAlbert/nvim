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
  {
    "chrisgrieser/nvim-early-retirement",
    opts = {
      -- if a buffer has been inactive for this many minutes, close it
      retirementAgeMins = 10,
      -- filetypes to ignore
      ignoredFiletypes = {},
      -- will not close the alternate file
      ignoreAltFile = true,
      -- minimum number of open buffers for auto-closing to become active, e.g.,
      -- by setting this to 4, no auto-closing will take place when you have 3
      -- or less open buffers. Note that this plugin never closes the currently
      -- active buffer, so a number < 2 will effectively disable this setting.
      minimumBufferNum = 3,
      -- will ignore buffers with unsaved changes. If false, the buffers will
      -- automatically be written and then closed.
      ignoreUnsavedChangesBufs = false,
      -- ignore non-empty buftypes, e.g. terminal buffers
      ignoreSpecialBuftypes = true,
      -- ignore visible buffers (buffers open in a window, "a" in `:buffers`)
      ignoreVisibleBufs = true,
      -- uses vim.notify for plugins like nvim-notify
      notificationOnAutoClose = true,
    },
    config = true,
    event = "VeryLazy",
  },
}
