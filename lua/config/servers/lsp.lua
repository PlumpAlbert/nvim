---@type table LSP server configurations
local M = {}

---@type string[] List of LSP servers to automatically install on start
M.install = { "lua_ls", "bashls" }

---@type string[]
local libraries = vim.api.nvim_get_runtime_file("", true)
libraries = vim.list_extend(libraries, {
	"/usr/share/awesome/lib",
})

local library = {}
for key, value in pairs(libraries) do
	library[value] = true
end

---@type table Table with custom LSP server options
M.options = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim", "awesome" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = library,
					checkThirdParty = false,
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	},
}

return M
