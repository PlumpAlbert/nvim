# newvim

Neovim-конфигурация для `NVIM_APPNAME=newvim`.

## Запуск

```bash
NVIM_APPNAME=newvim nvim
```

При первом запуске `lazy.nvim` установит плагины автоматически. LSP-серверы ставятся через Mason.

## Remote / tmux

Конфиг определяет SSH/tmux окружение в `lua/config/remote.lua` и включает:

- OSC52 clipboard provider (`vim.g.clipboard = "osc52"`) для копирования из remote/tmux в локальный clipboard.
- `clipboard=unnamedplus`.
- Маленький escape timeout (`ttimeoutlen=10`) для отзывчивых Alt/Esc mappings в tmux.
- `title`, `autoread`, mouse/mousemove events.
- Отключение лишних runtime providers на remote/tmux для более быстрого старта: node/perl/python3/ruby.

Рекомендуемый минимум для `~/.tmux.conf` на remote host:

```tmux
set -g default-terminal "tmux-256color"
set -as terminal-features ",xterm-256color:RGB,screen-256color:RGB,tmux-256color:RGB"
set -g set-clipboard on
set -sg escape-time 10
set -g focus-events on
```

Для OSC52 также должен разрешать clipboard твой локальный terminal emulator.

## Структура

- `lua/config/` — базовые настройки, keymaps, icons и bootstrap lazy.nvim.
- `lua/plugins/` — отдельные plugin specs для lazy.nvim: Treesitter, LSP/Mason, fzf-lua, gitsigns.arc.nvim, pi-nvim.

## Что включено

- Treesitter: подсветка, indent и folding для популярных языков.
- Folding: native Lua `foldexpr` на Neovim 0.13 + LSP `foldtext`.
- LSP: native `vim.lsp.config`/`vim.lsp.enable` + Mason/Mason LSPConfig.
- Completion: `nvim-cmp` с LSP/path/buffer/snippet sources и VSCode-like Nerd Font kind icons.
- Snippets: `LuaSnip` + `friendly-snippets`.
- Editing QoL: `mini.ai`, `mini.surround`, `mini.comment`, `mini.pairs`.
- Markdown UI: `render-markdown.nvim`.
- Highlight yanked text.
- fzf: `fzf-lua` для файлов, grep, буферов, help и `vim.ui.select`.
- Keymap hints: `which-key.nvim` для подсказок по `<leader>` mappings.
- Tmux/split navigation: `smart-splits.nvim` с tmux integration.
- Formatting: `conform.nvim` с выбором frontend formatter по root-pattern (`biome`, `deno`, `prettier`).
- Linting: `nvim-lint` с root-pattern выбором (`biome`, `eslint`, `ruff`, `shellcheck`).
- Realtime `autoread`, scroll padding и wrapped diagnostic virtual lines.
- Nerd Font symbols для diagnostics, fold column, fill/list chars и fzf prompts.
- File explorer: встроенный Neovim 0.13 `dir` plugin; legacy netrw отключён.
- Git/Arc signs: если существует `/Users/plumpalbert/arcadia/junk/a-matveev9/gitsigns.arc.nvim`, он подгружается как local plugin.
- Pi coding assistant: `pi-nvim` bridge для отправки промптов, файлов, буферов и выделений в running pi session.

## Основные хоткеи

- `<C-h/j/k/l>` — навигация между Neovim splits и tmux panes.
- `<A-h/j/k/l>` — resize splits.
- `za` — toggle fold, `zR` — открыть все folds, `zM` — закрыть все folds.
- `gr` — references через `fzf-lua` window.
- `<leader>lf` — format через `conform.nvim`.
- `<leader>lF` — raw LSP format.
- `<leader>ee` — открыть explorer в директории текущего файла.
- `<leader>ew` — открыть explorer в working directory.
- `<leader>ff` — поиск файлов.
- `]c` / `[c` — next/previous hunk.
- `<leader>hp` — preview hunk.
- `<leader>hb` — blame line.
- `<leader>hB` — toggle current line blame.
- `<leader>hs` / `<leader>hr` — stage/reset hunk.
- `<leader>fg` — live grep.
- `<leader>fb` — буферы.
- `<leader>gs` — git status picker.
- `<leader>gc` / `<leader>gC` — git commits / buffer commits picker.
- `<leader>gb` — git branches picker.
- `<leader>p` — открыть dialog `pi-nvim`.
- `<leader>pp` — отправить prompt в pi.
- `<leader>pf` — отправить текущий file path + prompt.
- `<leader>pb` — отправить весь buffer + prompt.
- Visual `<leader>ps` — отправить выделение + prompt.
- `<leader>pi` — проверить соединение с pi.
- `<leader>pl` — список running pi sessions.

Команды: `:Mason`, `:ConformInfo`, `:Format`, `:FormatDisable`, `:FormatDisable!`, `:FormatEnable`, `:Lint`, `:LintDisable`, `:LintDisable!`, `:LintEnable`, `:Pi`, `:PiSend`, `:PiSendFile`, `:PiSendSelection`, `:PiSendBuffer`, `:PiPing`, `:PiSessions`.

Formatter selection for JS/TS/frontend files:

1. `biome.json` / `biome.jsonc` → `biome`
2. `deno.json` / `deno.jsonc` → `deno_fmt`
3. `.prettierrc*`, `prettier.config.*`, or `package.json` with `prettier` key → `prettierd`, then `prettier`
4. no formatter config → no frontend formatter; falls back to LSP formatting

Для работы bridge нужно запустить `pi` в отдельном терминале. Pi-side пакет установлен командой `pi install npm:pi-nvim`; после установки в уже открытом pi выполни `/reload` или перезапусти pi.
