-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "<leader>c", vim.cmd.bdelete, { desc = "Close buffer" })

vim.keymap.set(
  { "n", "v" },
  "Y",
  '"+y<CR>',
  { desc = "Yank to system clipboard" }
)

--#region LuaSnip
vim.keymap.set({ "n", "x", "v" }, "<C-n>", function()
  local ls = require("luasnip")
  if ls.expand_or_locally_jumpable() then
    ls.expand_or_jump()
  end
end, { desc = "Jump to next snippet position" })

vim.keymap.set({ "n", "x", "v" }, "<C-p>", function()
  local ls = require("luasnip")
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { desc = "Jump to previous snippet position" })
--#endregion
