local M = {
  settings = {
    Lua = {
      workspace = {
        library = {
          ['/usr/share/nvim/runtime/lua'] = true,
          ['/usr/share/nvim/runtime/lua/vim'] = true,
          ['/usr/share/nvim/runtime/lua/vim/lsp'] = true,
          ['/usr/share/awesome/lib'] = true
        }
      };
      diagnostics = {
        enable = true;
        globals = {
          -- VIM
          "vim",
          "use", -- Packer use keyword
          -- AwesomeWM
          "awesome",
          "client",
          "root"
        }
      }
    }
  }
};
return M
