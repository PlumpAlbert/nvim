-- vim:ft=lua:ts=2:sw=0:et
local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
    spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
  ["q"] = { "<cmd>BufferClose<CR>", "Close buffer" },
  ["<Space>"] = { "<cmd>lua require('Comment.api').locked'toggle.linewise.current'<CR>", "Comment toggle current line" },
  ["/"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  e = { "<cmd>NvimTreeToggle<CR>", "Open file explorer" },
  f = {
    name = "Find",
    b = { "<cmd>Telescope buffers<cr>", "Switch buffers" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    w = { "<cmd>Telescope live_grep<cr>", "Find word" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferPick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    b = { "<cmd>BufferPrevious<cr>", "Previous" },
    n = { "<cmd>BufferNext<cr>", "Next" },
    h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
    l = { "<cmd>BufferCloseBuffersRight<cr>", "Close all to the right", },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerSync<cr>", "Sync" },
    s = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  -- " Available Debug Adapters:
  -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
  -- " Adapter configuration and installation instructions:
  -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
  -- " Debug Adapter protocol:
  -- "   https://microsoft.github.io/debug-adapter-protocol/
  -- " Debugging
  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  },
  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { function() require("plugins.lsp.init").format(false) end, "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic", },
    k = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic", },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    p = {
      name = "Go to",
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
    },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    r = { "<cmd>Lspsaga rename<CR>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  },
  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  },
}

-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd
local vmappings = {
  l = {
    f = { function() require 'plugins.lsp.init'.format(true) end, "Format range" }
  }
}

local which = require('which-key')
which.setup(setup)

which.register(mappings, opts)
which.register(vmappings, vopts)

-------------------------
-- Additional mappings --
-------------------------
local map = vim.api.nvim_set_keymap
-- Save file
map('n', '<C-s>', '<cmd>w<CR>', { noremap = true })
map('n', '<C-ы>', '<cmd>w<CR>', { noremap = true })
-- swap buffers
map('n', '<A-l>', '<cmd>BufferNext<CR>', { noremap = true })
map('n', '<A-h>', '<cmd>BufferPrevious<CR>', { noremap = true })
map('n', '<A-д>', '<cmd>BufferNext<CR>', { noremap = true })
map('n', '<A-р>', '<cmd>BufferPrevious<CR>', { noremap = true })
-- move buffers
map('n', '<A-.>', '<cmd>BufferMoveNext<CR>', { noremap = true })
map('n', '<A-,>', '<cmd>BufferMovePrevious<CR>', { noremap = true })
map('n', '<A-ю>', '<cmd>BufferMoveNext<CR>', { noremap = true })
map('n', '<A-б>', '<cmd>BufferMovePrevious<CR>', { noremap = true })
-- Keep VisualMode after indent with > or <
map('v', '>', '>gv', { noremap = true })
map('v', '<', '<gv', { noremap = true })
-- move selected block
map('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
map('v', 'О', ":m '>+1<CR>gv=gv", { noremap = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })
map('v', 'Л', ":m '<-2<CR>gv=gv", { noremap = true })
-- moving in wrapped lines
map('n', 'j', 'gj', { noremap = true })
map('n', 'k', 'gk', { noremap = true })
map('n', 'о', 'gj', { noremap = true })
map('n', 'л', 'gk', { noremap = true })
--------------------------------------
-------------- LSP Saga --------------
--------------------------------------
map('i', '<C-Space>', '<cmd>Lspsaga signature_help<CR>', { noremap = true })
map('s', '<C-Space>', '<cmd>Lspsaga signature_help<CR>', { noremap = true })
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { noremap = true })
map('n', '<C-j>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { noremap = true })
map('n', '<C-k>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { noremap = true })
