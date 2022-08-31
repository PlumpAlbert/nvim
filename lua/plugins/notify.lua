-- vim:ft=lua:ts=2:sw=0:et

local notify = require("notify")

notify.setup {
  background_colour = "#0a0a0a",
  fps = 60,
  icons = {
    DEBUG = " ",
    ERROR = " ",
    INFO = " ",
    TRACE = "✎ ",
    WARN = " "
  },
  level = 2,
  minimum_width = 50,
  render = "minimal",
  stages = "fade_in_slide_out",
  timeout = 3000,
}

vim.notify = notify
