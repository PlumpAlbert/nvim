local M = {}

M.diagnostics = {
  Error = " ",
  Warn = " ",
  Hint = "󰌵 ",
  Info = " ",
}

M.git = {
  added = " ",
  modified = " ",
  removed = " ",
}

M.ui = {
  folder_closed = " ",
  folder_open = " ",
  file = " ",
  search = " ",
  fold_closed = "",
  fold_open = "",
  fold_sep = " ",
  vertical = "│",
  horizontal = "─",
  corner = "╰",
  eob = " ",
}

return M
