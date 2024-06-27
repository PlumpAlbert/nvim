local M = {
	"williamboman/mason-lspconfig.nvim",
	event = { "VeryLazy" },
	dependencies = {
		"folke/neoconf.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"kevinhwang91/nvim-ufo",
		"b0o/schemastore.nvim",
		"neovim/nvim-lspconfig",
		"VonHeikemen/lsp-zero.nvim",
	},
}

--- @param bufnr number
local function setup_ufo(bufnr)
	local opts = require("neoconf").get("ufo", { enable = true })
	if opts.enable then
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local ufo = require("ufo")
		ufo.setup({
			close_fold_kinds_for_ft = {
				default = { "region", "comment", "imports" },
			},
		})

		vim.keymap.set(
			"n",
			"zR",
			ufo.openAllFolds,
			{ buffer = bufnr, desc = "Open all folds" }
		)

		vim.keymap.set(
			"n",
			"zM",
			ufo.closeAllFolds,
			{ buffer = bufnr, desc = "Close all folds" }
		)

		vim.keymap.set(
			"n",
			"zm",
			ufo.closeAllFolds,
			{ buffer = bufnr, desc = "Close all folds" }
		)
	end
end

M.config = function(_, opts)
	opts = opts or {}

	local zero = require("lsp-zero")
	zero.extend_lspconfig()

	zero.on_attach(function(client, bufnr)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end

		zero.default_keymaps({ buffer = bufnr })
		vim.keymap.set(
			"i",
			"<C-k>",
			vim.lsp.buf.signature_help,
			{ desc = "Signature help", buffer = bufnr }
		)

		setup_ufo(bufnr)
	end)

	zero.set_server_config({
		capabilities = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = true,
					lineFoldingOnly = true,
				},
			},
		},
	})

	local ensure_installed = vim.list_extend(
		opts.ensure_installed or {},
		{ "lua_ls", "jsonls", "yamlls" }
	)

	local handlers = vim.tbl_extend("force", opts.handlers or {}, {
		zero.default_setup,

		lua_ls = function(server_name)
			local opts = zero.nvim_lua_ls()
			require("lspconfig")[server_name].setup(opts)
		end,

		jsonls = function(server_name)
			local opts = zero.build_options(server_name, {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			require("lspconfig")[server_name].setup(opts)
		end,

		yamlls = function(server_name)
			local opts = zero.build_options(server_name, {
				settings = {
					json = {
						schemaStore = {
							enable = false,
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})

			require("lspconfig")[server_name].setup(opts)
		end,
	})

	require("mason-lspconfig").setup({
		ensure_installed = ensure_installed,
		handlers = handlers,
	})
end

return M
