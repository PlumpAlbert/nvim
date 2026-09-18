local eslint_configs = {
  ".eslintrc",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.mjs",
  ".eslintrc.json",
  ".eslintrc.yaml",
  ".eslintrc.yml",
  "eslint.config.js",
  "eslint.config.cjs",
  "eslint.config.mjs",
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

local function js_like_linters(bufnr)
  if find_up(bufnr, { "biome.json", "biome.jsonc" }) then
    return { "biomejs" }
  end

  if find_up(bufnr, eslint_configs) or package_json_has(bufnr, "eslintConfig") then
    return { "eslint_d" }
  end

  return {}
end

local linters_by_ft = {
  javascript = js_like_linters,
  javascriptreact = js_like_linters,
  typescript = js_like_linters,
  typescriptreact = js_like_linters,
  vue = js_like_linters,
  svelte = js_like_linters,
  css = js_like_linters,
  scss = js_like_linters,
  less = js_like_linters,
  json = js_like_linters,
  jsonc = js_like_linters,

  python = function()
    return { "ruff" }
  end,
  sh = function()
    return { "shellcheck" }
  end,
  zsh = function()
    return { "shellcheck" }
  end,
}

local function lint_buffer(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if vim.g.disable_lint or vim.b[bufnr].disable_lint then
    return
  end

  local selector = linters_by_ft[vim.bo[bufnr].filetype]
  if not selector then
    return
  end

  local linters = selector(bufnr)
  if #linters > 0 then
    require("lint").try_lint(linters)
  end
end

return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local group = vim.api.nvim_create_augroup("NewvimLint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = group,
        callback = function(event)
          lint_buffer(event.buf)
        end,
      })

      vim.api.nvim_create_user_command("Lint", function()
        lint_buffer()
      end, { desc = "Lint current buffer" })

      vim.api.nvim_create_user_command("LintDisable", function(args)
        if args.bang then
          vim.g.disable_lint = true
        else
          vim.b.disable_lint = true
        end
      end, { bang = true, desc = "Disable linting; use ! for global" })

      vim.api.nvim_create_user_command("LintEnable", function()
        vim.b.disable_lint = false
        vim.g.disable_lint = false
      end, { desc = "Enable linting" })
    end,
  },
}
