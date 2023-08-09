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

---@class LspKeymap
---@field mode ('v'|'n'|'x'|'s')[]|nil
---@field key string
---@field action string|function
---@field desc string

---@type LspKeymap[]
M.keys = {
	--#region diagnostics
	{
		key = "[d",
		action = vim.diagnostic.goto_prev,
		desc = "Go to previous diagnostic",
	},
	{
		key = "]d",
		action = vim.diagnostic.goto_next,
		desc = "Go to next diagnostic",
	},
	{
		key = "<leader>d",
		action = vim.diagnostic.open_float,
		desc = "Show line diagnostics",
	},
	--#endregion

	--#region folds
	{
		key = "zR",
		action = function()
			require("ufo").openAllFolds()
		end,
		desc = "Open all folds",
	},
	{
		key = "zr",
		action = function()
			local kinds = { "imports", "comment" }
			require("ufo").openFoldsExceptKinds(kinds)
		end,
		desc = "Open folds, except comments and imports",
	},
	{
		key = "zM",
		action = function()
			require("ufo").closeAllFolds()
		end,
		desc = "Close all folds",
	},
	{
		key = "zm",
		action = function()
			require("ufo").closeFoldsWith(0)
		end,
		desc = "Close folds with",
	},
	--#endregion

	--#region goto
	{
		key = "gD",
		action = vim.lsp.buf.declaration,
		desc = "Go to declaration",
	},
	{
		key = "gd",
		action = vim.lsp.buf.definition,
		desc = "Go to definition",
	},
	{
		key = "gi",
		action = vim.lsp.buf.implementation,
		desc = "Go to implementation",
	},
	{
		key = "gr",
		action = vim.lsp.buf.references,
		desc = "Go to references",
	},
	{
		key = "gT",
		action = function(...)
			local hasTelescope, builtins = pcall(require, "telescope.builtin")
			if hasTelescope then
				builtins.lsp_type_definitions()
				return
			end
			vim.lsp.buf.type_definition(...)
		end,
		desc = "Go to type definition",
	},
	--#endregion

	--#region workspaces
	{
		key = "<leader>wa",
		action = vim.lsp.buf.add_workspace_folder,
		desc = "Add workspace folder",
	},
	{
		key = "<leader>wr",
		action = vim.lsp.buf.add_workspace_folder,
		desc = "Remove workspace folder",
	},
	{
		key = "<leader>wl",
		action = function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end,
		desc = "Print workspace folders",
	},
	--#endregion

	--#region misc
	{
		key = "K",
		action = function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end,
		desc = "Symbol info",
	},
	{
		mode = { "n", "i" },
		key = "<C-p>",
		action = vim.lsp.buf.signature_help,
		desc = "Signature help",
	},
	{
		key = "<leader>lr",
		action = vim.lsp.buf.rename,
		desc = "Rename symbol",
	},
	{
		key = "<leader>la",
		action = vim.lsp.buf.code_action,
		desc = "Code actions",
	},
	{
		key = "<leader>lf",
		action = function()
			vim.lsp.buf.format({
				async = true,
				filter = function(client)
					return client.name ~= "tsserver"
				end,
			})
		end,
		desc = "Fomat document",
	},
	--#endregion
}

return M
