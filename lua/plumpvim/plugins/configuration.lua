---Trim filepath
---@param path string
local function trim_filepath(path)
  local split = vim.split(path, '/', {
    trimempty = true,
    plain = true,
  })
  local parents = vim.list_slice(split, 1, #split - 1)

  for i = 1, #parents do
    parents[i] = parents[i]:sub(1, 2)
  end

  return string.format('%s/%s', table.concat(parents, '/'), split[#split])
end

return {
  -- PlumpAlbert/options.nvim
  {
    'PlumpAlbert/options.nvim',
    lazy = false,
    opts = {},
    main = 'options',
    dependencies = {
      'folke/neoconf.nvim',
      'xiyaowong/transparent.nvim',
    },
  },
  -- wakatime/vim-wakatime
  {
    'wakatime/vim-wakatime',
    lazy = false,
  },
  -- michaelrommel/nvim-silicon
  {
    'michaelrommel/nvim-silicon',
    lazy = true,
    cmd = 'Silicon',
    keys = {
      {
        '<leader>s',
        ':Silicon<CR>',
        desc = 'Code snippet',
      },
      {
        '<leader>s',
        ":'<,'>Silicon<CR>",
        desc = 'Code snippet',
        mode = { 'v' },
      },
    },
    opts = {
      theme = 'gruvbox-dark',
      background = '#076678',
      pad_horiz = 80,
      pad_vert = 40,
      no_round_corner = true,
      no_window_controls = true,
      no_line_number = false,
      line_offset = function(args)
        if args.range == 1 then
          return args.line1
        end
        return 1
      end,
      line_pad = 0,
      tab_width = 2,
      language = function()
        local ft = vim.bo.filetype

        if ft == 'jsonc' then
          return 'json'
        end

        return ft
      end,
      shadow_blur_radius = 24,
      shadow_offset_x = 8,
      shadow_offset_y = 8,
      shadow_color = '#100808',
      gobble = true,
      to_clipboard = true,
      window_title = function()
        local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
        local relative_path = vim.fn.expand '%:.'

        local max_width = vim.o.textwidth
        if max_width == 0 then
          max_width = 80
        end

        if string.len(relative_path) > max_width - string.len(cwd) then
          relative_path = trim_filepath(relative_path)
        end

        return string.format('[%s] %s', cwd, relative_path)
      end,
      wslclipboard = 'auto',
      wslclipboardcopy = 'delete',
      command = 'silicon',
    },
  },
  -- nvim-neo-tree/neo-tree.nvim
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'echasnovski/mini.icons',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
    },
    main = 'neo-tree',
    keys = {
      {
        '<leader>e',
        function()
          require('neo-tree.command').execute {
            action = 'focus',
            source = 'filesystem',
            toggle = true,
            reveal = true,
          }
        end,
      },
    },
    opts = {
      close_if_last_window = false,
      popup_border_style = 'rounded',
      enable_git_status = false,
      enable_diagnostics = false,
      window = {
        position = 'float',
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          always_show = {
            '.gitignored',
            '.gitignore',
            '.neoconf.json',
          },
          always_show_by_pattern = {
            '.env*',
          },
          never_show = {
            'node_modules',
            '.DS_Store',
            'thumbs.db',
            '.git',
          },
        },
      },
    },
  },
  -- s1n7ax/nvim-window-picker
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    lazy = true,
    version = '2.*',
    opts = {
      hint = 'floating-letter',
      filter_rules = {
        autoselect_one = true,
        include_current_win = false,
        bo = {
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
          buftype = { 'terminal', 'quickfix' },
        },
      },
    },
  },
  -- folke/which-key.nvim
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = { preset = 'helix' },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer local keymaps',
      },
    },
  },
  -- bbjornstad/pretty-fold.nvim
  {
    'bbjornstad/pretty-fold.nvim',
    event = { 'BufReadPre', 'BufEnter' },
    config = true,
    opts = {
      sections = {
        left = { 'content' },
        right = {
          ' ',
          'number_of_folded_lines',
          ' ',
          function(config)
            return config.fill_char:rep(3)
          end,
        },
      },
      fill_char = '-',
      remove_fold_markers = true,
      keep_indentation = true,
      process_comment_signs = 'spaces',
      stop_words = {
        '@brief%s*',
      },
      add_close_pattern = true,
      ft_ignore = { 'neorg' },
    },
  },
  -- NvChad/nvim-colorizer.lua
  {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufEnter' },
    opts = {
      user_default_options = {
        mode = 'virtualtext',
        virtualtext = '■',
        virtualtext_inline = false,
        virtualtext_mode = 'foreground',
      },
    },
  },
  -- fladson/vim-kitty
  {
    'fladson/vim-kitty',
    ft = 'kitty',
  },
}
