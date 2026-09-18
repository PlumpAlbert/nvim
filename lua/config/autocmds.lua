local group = vim.api.nvim_create_augroup("NewvimQoL", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight yanked text",
  callback = function()
    vim.hl.hl_op({
      higroup = "IncSearch",
      timeout = 180,
    })
  end,
})
