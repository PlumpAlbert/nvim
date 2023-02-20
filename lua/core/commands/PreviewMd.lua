--vim:ft=lua:ts=4:sw=0:et
vim.api.nvim_create_user_command('PreviewMd', function()
  local file = vim.fn.expand('%:p')
  os.execute(string.format(
      'gh markdown-preview --dark-mode --host 127.0.0.1 %s > /dev/null 2>&1 &',
      file
  ))
end, {})

vim.api.nvim_create_user_command('StopPreview', function()
  os.execute("pkill gh >/dev/null 2>&1")
end, {})
