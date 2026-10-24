# nvim

Конфигурация Neovim.

## Запуск

```bash
nvim
```

При первом запуске `lazy.nvim` установит плагины автоматически. Нужные LSP-серверы устанавливай вручную через `:Mason`.
Установленные через Mason серверы включаются автоматически для подходящих типов файлов со стандартными конфигами `nvim-lspconfig` и поддержкой completion. Автоустановка LSP отключена.

## Remote / SSH

Конфиг определяет SSH-окружение в `lua/config/remote.lua` и включает:

- OSC52 clipboard provider (`vim.g.clipboard = "osc52"`) для копирования из SSH-сессии в локальный clipboard.
- `clipboard=unnamedplus`.
- Маленький escape timeout (`ttimeoutlen=10`) для отзывчивых Alt/Esc mappings в терминале.
- `title`, `autoread`, mouse/mousemove events.
- Отключение лишних runtime providers в SSH-сессии для более быстрого старта: node/perl/python3/ruby.

Для OSC52 также должен разрешать clipboard твой локальный terminal emulator.

## Структура

- `lua/config/` — базовые настройки, keymaps, icons и bootstrap lazy.nvim.
- `lua/plugins/` — отдельные plugin specs для lazy.nvim: Treesitter, LSP/Mason, fzf-lua, gitsigns.arc.nvim, pi-nvim.

## Что включено

- Treesitter: подсветка, indent и folding для популярных языков.
- Folding: native Lua `foldexpr` на Neovim 0.13 + LSP `foldtext`.
- LSP: native `vim.lsp.config`/`vim.lsp.enable` + Mason/Mason LSPConfig; ручная установка серверов, автоматическое подключение со стандартными конфигами.
- Completion: `nvim-cmp` с LSP/path/buffer/snippet sources и VSCode-like Nerd Font kind icons.
- Snippets: `LuaSnip` + `friendly-snippets`.
- Editing QoL: `mini.ai`, `mini.surround` (`gz` mappings), `mini.comment`, `mini.pairs`, `mini.icons`.
- Markdown UI: `render-markdown.nvim`.
- Highlight yanked text.
- fzf: `fzf-lua` для файлов, grep, буферов, help и `vim.ui.select`.
- Keymap hints: `which-key.nvim` для подсказок по `<leader>` mappings.
- Split navigation: `smart-splits.nvim` для локальных Neovim splits; внутри Herdr (`HERDR_ENV=1`) — `herdr-splits.nvim` для Neovim splits и Herdr panes. Herdr-side plugin и keybindings установлены в Herdr config.
- Formatting: `conform.nvim` с выбором frontend formatter по root-pattern (`biome`, `deno`, `prettier`).
- Linting: `nvim-lint` с root-pattern выбором (`biome`, `eslint`, `ruff`, `shellcheck`); отсутствующие исполняемые файлы линтеров пропускаются.
- Realtime `autoread`, scroll padding и wrapped diagnostic virtual lines.
- Nerd Font symbols для diagnostics, fold column, fill/list chars и fzf prompts.
- File explorer обычного Neovim: `neo-tree.nvim` в плавающем окне, с иконками `mini.icons` и выбором окна через `nvim-window-picker`; в VS Code используется его Explorer. Встроенные `dir` и netrw отключены.
- Git/Arc signs: если существует `/Users/plumpalbert/arcadia/junk/a-matveev9/gitsigns.arc.nvim`, он подгружается как local plugin.
- Pi coding assistant: `pi-nvim` bridge для отправки промптов, файлов, буферов и выделений в running pi session.

## Основные хоткеи

- `<C-h/j/k/l>` — навигация по Neovim splits; внутри Herdr на краю редактора — переход в соседний pane.
- `<A-h/j/k/l>` — resize split; внутри Herdr также меняет размер pane, когда редактор занимает его целиком.
- `za` — toggle fold, `zR` — открыть все folds, `zM` — закрыть все folds.
- `s` — стандартная замена символа с переходом в insert mode.
- `Y` — копировать в системный clipboard.
- `gza` / `gzd` / `gzr` — добавить / удалить / заменить окружающие скобки или кавычки (`mini.surround`).
- `gzf` / `gzF` / `gzh` — найти справа / найти слева / подсветить окружающие скобки или кавычки; `gzn` обновляет область поиска.
- `<C-s>` — сохранить все файлы.
- Визуальный режим: `<` / `>` меняют отступ и сохраняют выделение; `J` / `K` перемещают выделенные строки; `p` вставляет, не заменяя clipboard.
- `j` / `k` перемещают курсор по экранным строкам с учётом переноса текста.
- `<leader><Space>` / `<leader>/` / `<leader>,` — поиск файлов / поиск по тексту / список буферов.
- `<leader>r` — продолжить последний picker.
- `<leader>ls` / `<leader>ld` / `<leader>lS` / `<leader>la` / `<leader>lt` — LSP references / определения / символы проекта / code actions / определения типов.
- `<leader>lf` — format через `conform.nvim`.
- `<leader>lF` — raw LSP format.
- `<leader>e` — открыть плавающее файловое дерево Neo-tree.
- `<leader>E` — показать текущий файл в дереве или закрыть его.
- `<leader>de` — открыть диагностику текущей строки.
- `<leader>.` — открыть список буферов в Neo-tree.
- `]c` / `[c` — next/previous hunk.
- `<leader>hp` — preview hunk.
- `<leader>hb` — blame line.
- `<leader>hB` — toggle current line blame.
- `<leader>hs` / `<leader>hr` — stage/reset hunk.
- `<leader>gs` — git status picker.
- `<leader>gc` / `<leader>gl` — git commits / buffer commits picker.
- `<leader>gb` — git branches picker.
- `<leader>p` — открыть dialog `pi-nvim`.
- `<leader>pp` — отправить prompt в pi.
- `<leader>pf` — отправить текущий file path + prompt.
- `<leader>pb` — отправить весь buffer + prompt.
- Visual `<leader>ps` — отправить выделение + prompt.
- `<leader>pi` — проверить соединение с pi.
- `<leader>pl` — список running pi sessions.

В Neo-tree клавиша `?` показывает доступные действия файлового проводника.

Настройки редакторных действий для `vscode-neovim` изолированы в `lua/config/keymaps/vscode.lua`; настройки обычного Neovim находятся в `lua/config/keymaps/neovim.lua`. В профиле VS Code отключены Neovim LSP, Mason, nvim-cmp, nvim-lint, Conform, Gitsigns, smart-splits и herdr-splits; completion, diagnostics и formatting остаются за VS Code. Clipboard использует provider расширения.

В режиме `vscode-neovim` сочетания `<leader>e`, `<leader><Space>`, `<leader>/`, `<leader>,`, `<leader>t`, `<leader>b`, `<leader>sp`, `<leader>cn` и `<leader>cp` управляют Explorer, поиском файлов, поиском по проекту, списком редакторов, терминалом, breakpoint, Problems, уведомлениями и Command Palette. LSP-действия и `<leader>lf` используют команды VS Code. Группы редакторов переключаются встроенными командами расширения через `<C-w>h/j/k/l`; размер меняется через `<C-w><` / `<C-w>>` и `<C-w>-` / `<C-w>+`. Split-плагины в этом профиле не загружаются. `<C-s>` сохраняет файлы и требует passthrough в пользовательском `keybindings.json`.

В обычном Neovim доступны команды `:Mason`, `:ConformInfo`, `:Format`, `:FormatDisable`, `:FormatDisable!`, `:FormatEnable`, `:Lint`, `:LintDisable`, `:LintDisable!`, `:LintEnable`. Команды Pi: `:Pi`, `:PiSend`, `:PiSendFile`, `:PiSendSelection`, `:PiSendBuffer`, `:PiPing`, `:PiSessions`.

Formatter selection for JS/TS/frontend files:

1. `biome.json` / `biome.jsonc` → `biome`
2. `deno.json` / `deno.jsonc` → `deno_fmt`
3. `.prettierrc*`, `prettier.config.*`, or `package.json` with `prettier` key → `prettierd`, then `prettier`
4. no formatter config → no frontend formatter; falls back to LSP formatting

Для работы bridge нужно запустить `pi` в отдельном терминале. Pi-side пакет установлен командой `pi install npm:pi-nvim`; после установки в уже открытом pi выполни `/reload` или перезапусти pi.
