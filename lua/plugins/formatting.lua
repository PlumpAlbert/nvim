local prettier_configs = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.json5",
  ".prettierrc.yml",
  ".prettierrc.yaml",
  ".prettierrc.toml",
  ".prettierrc.js",
  ".prettierrc.cjs",
  ".prettierrc.mjs",
  "prettier.config.js",
  "prettier.config.cjs",
  "prettier.config.mjs",
}

local function buf_dir(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name ~= "" then
    return vim.fs.dirname(name)
  end
  return vim.fn.getcwd()
end

local function find_up(bufnr, names)
  return vim.fs.find(names, {
    path = buf_dir(bufnr),
    upward = true,
    type = "file",
  })[1]
end

local function package_json_has(bufnr, key)
  local package_json = find_up(bufnr, { "package.json" })
  if not package_json then
    return false
  end

  local ok, content = pcall(vim.fn.readfile, package_json)
  if not ok then
    return false
  end

  local ok_decode, json = pcall(vim.json.decode, table.concat(content, "\n"))
  return ok_decode and type(json) == "table" and json[key] ~= nil
end

local function js_like_formatters(bufnr)
  if find_up(bufnr, { "biome.json", "biome.jsonc" }) then
    return { "biome" }
  end

  if find_up(bufnr, { "deno.json", "deno.jsonc" }) then
    return { "deno_fmt" }
  end

  if find_up(bufnr, prettier_configs) or package_json_has(bufnr, "prettier") then
    return { "prettierd", "prettier", stop_after_first = true }
  end

  -- No formatter config found near the file: avoid imposing a frontend formatter.
  -- conform will fall back to LSP formatting when requested.
  return {}
end

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = { "n", "v" },
        desc = "Format",
      },
    },
    opts = {
      notify_on_error = false,
      notify_no_formatters = false,
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return {
          timeout_ms = 3000,
          lsp_format = "fallback",
        }
      end,
      formatters_by_ft = {
        javascript = js_like_formatters,
        javascriptreact = js_like_formatters,
        typescript = js_like_formatters,
        typescriptreact = js_like_formatters,
        vue = js_like_formatters,
        svelte = js_like_formatters,
        css = js_like_formatters,
        scss = js_like_formatters,
        less = js_like_formatters,
        html = js_like_formatters,
        json = js_like_formatters,
        jsonc = js_like_formatters,
        yaml = js_like_formatters,
        markdown = js_like_formatters,

        lua = { "stylua" },
        python = { "ruff_format", "black", stop_after_first = true },
        go = { "goimports", "gofmt", stop_after_first = true },
        rust = { "rustfmt" },
        sh = { "shfmt" },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)

      vim.api.nvim_create_user_command("Format", function(args)
        require("conform").format({
          async = true,
          lsp_format = "fallback",
          range = args.range ~= 0 and {
            start = { args.line1, 0 },
            ["end"] = { args.line2, 0 },
          } or nil,
        })
      end, { range = true, desc = "Format current buffer or range" })

      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.g.disable_autoformat = true
        else
          vim.b.disable_autoformat = true
        end
      end, { bang = true, desc = "Disable autoformat-on-save; use ! for global" })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, { desc = "Enable autoformat-on-save" })
    end,
  },
}
