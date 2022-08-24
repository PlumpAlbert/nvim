-- vim:ft=lua:ts=2:sw=0:et
local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local default = {
  auto_install = true,
  ensure_installed = {
    "lua",
    "vim",
    "bash",
    "javascript",
    "typescript",
    "jsdoc",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 5000,
  }
}

ts_config.setup(default)
