local M = {
  'ibhagwan/fzf-lua',
  lazy = true,
  dependencies = { 'echasnovski/mini.icons' },
  cmd = 'FzfLua',
}

M.opts = {
  'fzf-tmux',
  winopts = {
    preview = {
      layout = 'flex',
      vertical = 'down:85%',
      horizontal = 'right:75%',
    },
  },
  fzf_opts = {
    ['--border'] = 'bold',
    ['--tmux'] = 'center,100%,border-native',
  },
  previewers = {
    bat = {
      cmd = 'bat',
      args = '--theme base16 --color=always --style=numbers,changes',
    },
  },
}

M.keys = {
  {
    '<leader>q',
    function()
      require('fzf-lua').quickfix()
    end,
    desc = 'Search project files',
  },
  {
    '<leader><Space>',
    function()
      require('fzf-lua').files()
    end,
    desc = 'Search project files',
  },
  {
    '<leader>.',
    function()
      require('fzf-lua').buffers()
    end,
    desc = 'Search buffers',
  },
  {
    '<leader>/',
    function()
      require('fzf-lua').live_grep_resume()
    end,
    desc = 'Search project words',
  },
  {
    '<leader>gl',
    function()
      require('fzf-lua').git_bcommits()
    end,
    desc = 'Search commits',
  },
  ---#region LSP
  {
    '<leader>la',
    function()
      require('fzf-lua').lsp_code_actions()
    end,
    desc = '[LSP] Code actions',
  },
  {
    '<leader>lD',
    function()
      require('fzf-lua').lsp_definitions()
    end,
    desc = '[LSP] Go to definitions',
  },
  {
    '<leader>lt',
    function()
      require('fzf-lua').lsp_typedefs()
    end,
    desc = '[LSP] Go to type definitions',
  },
  {
    '<leader>ls',
    function()
      require('fzf-lua').lsp_finder()
    end,
    desc = '[LSP] Finder',
  },
  {
    '<leader>lr',
    function()
      require('fzf-lua').lsp_references()
    end,
    desc = '[LSP] Go to references',
  },
  {
    '<leader>ld',
    function()
      require('fzf-lua').lsp_document_diagnostics()
    end,
    desc = '[LSP] Diagnostics',
  },
  ---#endregion
}

return M
