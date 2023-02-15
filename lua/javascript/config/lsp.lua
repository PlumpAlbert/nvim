local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

lsp.configure('tsserver', {})
lsp.configure('emmet_ls', {})
lsp.configure('cssls', {})
lsp.configure('tailwindcss', {})
