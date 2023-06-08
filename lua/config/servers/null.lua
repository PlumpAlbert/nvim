local ns = require("null-ls")

---@type table null.ls configuration
local M = {}

---@type string[] List of null-ls backends to install
M.install = { "stylua", "shfmt" }
---@type table List of null-ls sources
M.sources = {
	ns.builtins.formatting.stylua,
	ns.builtins.formatting.shfmt,
}

return M
