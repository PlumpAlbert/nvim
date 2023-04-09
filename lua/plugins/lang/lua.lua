---@param root_path string
local function get_libs(root_path)
  local libs = {}

  for _, p in pairs(vim.fn.expand(root_path, false, true)) do
    local lib_path = vim.loop.fs_realpath(p)
    if lib_path ~= nil then
      libs[#libs + 1] = lib_path
    end
  end

  return libs
end

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                library = vim.list_extend(
                  vim.api.nvim_get_runtime_file("*", true),
                  get_libs("/usr/share/awesome/lib")
                ),
              },
            },
          },
        },
      },
    },
  },
}
