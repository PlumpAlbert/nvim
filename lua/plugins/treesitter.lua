return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "vim", "bash" },
      auto_install = true,
      indent = { enable = true },
    },
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local rainbow = require("ts-rainbow")
      require("nvim-treesitter.configs").setup({
        rainbow = {
          query = {
            "rainbow-parens",
            html = "rainbow-tags",
            xml = "rainbow-tags",
            jsx = "rainbow-tags",
            tsx = "rainbow-tags",
          },
          strategy = {
            rainbow.strategy.global,
            commonlisp = rainbow.strategy["local"],
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = { enable = true },
      })
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
          config = {
            javascript = {
              __default = "// %s",
              jsx_element = "{/* %s */}",
              jsx_fragment = "{/* %s */}",
              jsx_attribute = "// %s",
              comment = "// %s",
            },
          },
        },
      })
    end,
  },
}
