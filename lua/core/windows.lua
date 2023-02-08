local localDir = os.getenv('LOCALAPPDATA') or vim.fn.expand("~/AppData/Local")

vim.opt.shell = "pwsh.exe"
vim.opt.shellquote = nil
vim.opt.shellxquote = nil
vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.opt.fileformat = 'dos'
vim.opt.guifont = 'JetBrainsMono NF:h11'
