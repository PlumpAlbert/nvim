-- vim:ft=lua:ts=2:sw=0:et

local mason = require 'mason'
local masonlsp = require 'mason-lspconfig'

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

masonlsp.setup {
  automatic_installation = true
}
