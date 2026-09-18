local plugin_dir = os.getenv("HOME") .. "/arcadia/junk/a-matveev9/gitsigns.arc.nvim"

if not vim.uv.fs_stat(plugin_dir) then
  return {}
end

return {
  {
    dir = plugin_dir,
    name = "gitsigns.arc.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local icons = require("config.icons")

      require("gitsigns").setup({
        signs = {
          add = { text = icons.git.added },
          change = { text = icons.git.modified },
          delete = { text = icons.git.removed },
          topdelete = { text = icons.git.removed },
          changedelete = { text = icons.git.modified },
          untracked = { text = "┆ " },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = { follow_files = true },
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 700,
          ignore_whitespace = false,
        },
        preview_config = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, lhs, rhs, desc, opts)
            opts = opts or {}
            opts.buffer = bufnr
            opts.desc = desc
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(gs.next_hunk)
            return "<Ignore>"
          end, "Git: next hunk", { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(gs.prev_hunk)
            return "<Ignore>"
          end, "Git: previous hunk", { expr = true })

          map("n", "<leader>hs", gs.stage_hunk, "Git: stage hunk")
          map("n", "<leader>hr", gs.reset_hunk, "Git: reset hunk")
          map("v", "<leader>hs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, "Git: stage selected hunk")
          map("v", "<leader>hr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, "Git: reset selected hunk")
          map("n", "<leader>hS", gs.stage_buffer, "Git: stage buffer")
          map("n", "<leader>hu", gs.undo_stage_hunk, "Git: undo stage hunk")
          map("n", "<leader>hR", gs.reset_buffer, "Git: reset buffer")
          map("n", "<leader>hp", gs.preview_hunk, "Git: preview hunk")
          map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
          end, "Git: blame line")
          map("n", "<leader>hB", gs.toggle_current_line_blame, "Git: toggle line blame")
          map("n", "<leader>hd", gs.diffthis, "Git: diff this")
          map("n", "<leader>hD", function()
            gs.diffthis("~")
          end, "Git: diff this against base")
          map("n", "<leader>hQ", gs.setqflist, "Git: hunks to quickfix")
          map("n", "<leader>hl", gs.setloclist, "Git: hunks to loclist")
          map("n", "<leader>ht", gs.toggle_deleted, "Git: toggle deleted")
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Git: hunk text object")
        end,
      })
    end,
  },
}
