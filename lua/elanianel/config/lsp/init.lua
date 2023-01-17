-- vim:ft=lua:ts=4:sw=0:et
require 'elanianel.config.lsp.completion'
require 'neodev'.setup {}
local lsp = require 'lsp-zero'
lsp.set_preferences({
    setup_servers_on_start = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = false,
    suggest_lsp_servers = false,
    set_lsp_keymaps = false,
    call_servers = 'local',
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
    }
})


vim.diagnostic.config({
    virtual_text = true
})

require 'elanianel.config.lsp.servers.lua'.configure(lsp)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
lsp.setup_servers { opts = { capabilities = capabilities } }
lsp.setup {}

require 'ufo'.setup {}

require 'elanianel.config.lsp.null'
