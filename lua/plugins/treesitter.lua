return {
  {
    "HiPhish/nvim-ts-rainbow2",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return {
        ensure_installed = { "lua", "vim", "bash" },
        auto_install = true,
        indent = { enable = true },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, buf)
            if vim.tbl_contains({ "latex" }, lang) then
              return true
            end

            local status_ok, big_file_detected =
              pcall(vim.api.nvim_buf_get_var, buf, "bigfile_disable_treesitter")
            return status_ok and big_file_detected
          end,
        },
        autotag = { enable = true },
        rainbow = {
          enable = true,
          query = {
            "rainbow-parens",
            html = "rainbow-tags",
            xml = "rainbow-tags",
            jsx = "rainbow-tags",
            tsx = "rainbow-tags",
          },
        },
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
      }
    end,
  },
}
