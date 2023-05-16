local M = {}

M.init = function()
	local lsp = require("lspconfig")

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			require("ufo").setup()
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			--- @param description string
			local function opts(description)
				return { noremap = true, buffer = ev.buf, desc = description }
			end

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			vim.keymap.set("n", "zR", require("ufo").openAllFolds, opts("Open all folds"))
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds, opts("Close all folds"))
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, opts("Open folds but not kinds"))
			vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, opts("Close folds with"))
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
			vim.keymap.set("n", "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					-- choose one of coc.nvim and nvim lsp
					vim.lsp.buf.hover()
				end
			end, opts("Symbol info"))
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts("Signature help"))
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts("Print workspace folders"))
			vim.keymap.set("n", "<space>gt", vim.lsp.buf.type_definition, opts("Go to type definition"))
			vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, opts("Rename symbol"))
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts("Code actions"))
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to references"))
			vim.keymap.set("n", "<space>lf", function()
				vim.lsp.buf.format({
					async = true,
					filter = function(client)
						return client.name ~= "tsserver"
					end,
				})
			end, opts("Format document"))
		end,
	})

	require("lspconfig").lua_ls.setup({
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
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

return M
