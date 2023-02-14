-- vim:ft=lua:ts=4:sw=0:et
local M = {}

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

M.configure = function(lsp)
    lsp.configure('lua_ls', {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = luaLibrary,
                    checkThirdParty = false,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = { enable = false, },
            },
        },
    })
end

return M
