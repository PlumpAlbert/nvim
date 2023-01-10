local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'emmet_ls',
    'sumneko_lua',
})

local cmp = require('cmp')
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
-- disable completion with tab
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
})

vim.diagnostic.config({
    virtual_text = true
})


local luaLibrary = vim.api.nvim_get_runtime_file("", true)
local function addLibrary(path)
    for _, p in pairs(vim.fn.expand(path, false, true)) do
        p = vim.loop.fs_realpath(p)
        if p ~= nil then
            luaLibrary[p] = true
        end
    end
end

if vim.fn.has('unix') == 1 then
    addLibrary('/usr/share/awesome/lib')
end

lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = luaLibrary,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false, },
        },
    },
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint_d" then
        return
    end

    if client.name ~= 'tsserver' then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.range_formatting = false
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
lsp.setup_servers {
    opts = {
        capabilities = capabilities
    }
}

lsp.setup()
require 'ufo'.setup()

local null_ls = require "null-ls"
local null_opts = lsp.build_options('null-ls', {})
local b = null_ls.builtins;
null_ls.setup {
    default_timeout = 10000,
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
    end,
    sources = {
        b.diagnostics.cspell.with {
            extra_args = { '--config', '~/.config/cspell.json' }
        },
        b.diagnostics.eslint_d,
        b.code_actions.eslint_d,
        -- prettier
        b.formatting.prettierd.with {
            env = { PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.prettierrc') },
            extra_filetypes = {
                "javascript", "javascriptreact", "typescript",
                "typescriptreact", "vue", "css", "scss", "less", "html",
                "json", "jsonc", "markdown", "graphql", "handlebars"
            }
        },
        -- Shell
        b.formatting.shfmt,
        -- Python
        b.formatting.autopep8.with {
            extra_args = {
                '--max-line-length', '80',
                '--experimental'
            }
        },
    }
}
-- vim:ft=lua:ts=4:sw=0:et
