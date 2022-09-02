-- vim:ft=lua:ts=2:sw=0

local M = {}

M.map = function(mode, keys, command, opt)
  local options = { noremap = true, silent = true }
  if opt then
    options = vim.tbl_extend("force", options, opt)
  end

  -- all valid modes allowed for mappings
  -- :h map-modes
  local valid_modes = {
    [""] = true,
    ["n"] = true,
    ["v"] = true,
    ["s"] = true,
    ["x"] = true,
    ["o"] = true,
    ["!"] = true,
    ["i"] = true,
    ["l"] = true,
    ["c"] = true,
    ["t"] = true,
  }

  -- helper function for M.map
  -- can gives multiple modes and keys
  local function map_wrapper(sub_mode, lhs, rhs, sub_options)
    if type(lhs) == "table" then
      for _, key in ipairs(lhs) do
        map_wrapper(sub_mode, key, rhs, sub_options)
      end
    else
      if type(sub_mode) == "table" then
        for _, m in ipairs(sub_mode) do
          map_wrapper(m, lhs, rhs, sub_options)
        end
      else
        if valid_modes[sub_mode] and lhs and rhs then
          vim.api.nvim_set_keymap(sub_mode, lhs, rhs, sub_options)
        else
          sub_mode, lhs, rhs = sub_mode or "", lhs or "", rhs or ""
          print(
            "Cannot set mapping [ mode = '" ..
            sub_mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]"
          )
        end
      end
    end
  end

  map_wrapper(mode, keys, command, options)
end

local function wait(seconds)
  local start = os.clock()
  while os.clock() - start <= seconds do end
end

M.rayso = function(opts)
  local bufnr = vim.fn.bufnr('%')
  local title = vim.api.nvim_buf_get_name(bufnr)
  local text = table.concat(
    vim.api.nvim_buf_get_lines(bufnr, opts.line1 or 0, opts.line2 or -1, false),
    "\n"
  )
  local base64proc = io.popen('base64 > /tmp/rayso.base64', 'w')
  if base64proc == nil then
    vim.notify("Couldn't start `base64` process", "error")
    return
  end
  base64proc:write(text)
  base64proc:close()
  local base64 = io.open('/tmp/rayso.base64', 'r')
  if base64 == nil then
    vim.notify("Couldn't open base64 encoded file", "error")
    return
  end
  local code = base64:read("*a"):gsub('%+', "%%2B")
  local url = string.format(
    "open 'https://ray.so/?colors=midnight&background=true&darkMode=true&padding=64&language=%s&title=%s&code=%s'",
    vim.api.nvim_buf_get_option(bufnr, 'filetype'),
    title,
    code
  )
  local rayso = io.popen(url)
  if rayso == nil then
    vim.notify("Couldn't open `rayso`", "error")
    return
  end
  rayso:close()
end

vim.api.nvim_create_user_command('Rayso', M.rayso, { nargs = 0, range = '%' })

function char_to_hex(c)
  return string.format("%%%02X", string.byte(c))
end

function urlencode(url)
  if url == nil then
    return
  end
  url = url:gsub("\n", "\r\n")
  url = url:gsub("([^%w ])", char_to_hex)
  url = url:gsub(" ", "+")
  return url
end

return M
