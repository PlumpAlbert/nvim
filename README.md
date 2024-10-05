 # Repository Name

Welcome to the repository of my Neovim configuration! This setup is designed to provide an efficient and customizable environment tailored for both productivity and aesthetics. Below, you'll find detailed information about the plugins, key mappings, and general configurations used in this setup.

## Plugins

### 1. Neo-Tree
This plugin enhances file management within Neovim by providing a graphical interface to navigate through your filesystem or opened buffers. Keybindings for opening specific views are provided below:

- **Open File Explorer (at current file)**: `<leader>E`
  - This command opens the Neo-Tree with the focus set on the currently edited file, making it easy to manage files from where you are working.
  
- **Open Buffers**: `<leader>.`
  - Use this shortcut to view and switch between open buffers quickly.

#### Configuration for Neo-Tree
The configuration of Neo-Tree includes settings such as popup border style, enabling diagnostics, sorting options, and default component configurations like git status icons. You can find the full setup in the plugin section below.

### 2. Wakatime Plugin
This plugin integrates with your coding activities to track how you code and provides insights about your programming habits. It's particularly useful for developers looking to improve their productivity by understanding patterns over time.

### 3. Which-Key
Which-Key is a plugin that helps in exploring and learning keybindings available in your Neovim setup. It displays a popup with possible key commands as you type. Useful for those new to the configuration or when you simply want to remember what each command does without searching through documentation every time.

### 4. Window-Picker
Window-Picker is a plugin that facilitates quick switching between open windows by highlighting them in a unique way, which can be configured to appear either in statuslines or winbars based on your preference. This tool is particularly useful for developers who frequently switch between multiple coding contexts.

## Key Mappings
Key mappings are shortcuts that make navigation and actions more efficient. Here are some key bindings you'll find useful:

- `<leader>E`: Open File Explorer at the current file position.
- `<leader>.`: View open buffers for easy switching.

## Installation
To install this configuration, ensure you have a compatible version of Neovim and then use your plugin manager of choice (e.g., Packer, Vim Plug). Add the plugins to your config file with their respective installation commands.
