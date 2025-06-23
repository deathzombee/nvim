# 🚀 My Neovim Configuration

A well-organized Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim) with custom enhancements and language-specific configurations.

## 🏗️ Structure

```
nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/             # Core configuration
│   │   ├── lazy.lua        # Plugin manager setup
│   │   ├── options.lua     # Neovim options
│   │   ├── keymaps.lua     # Basic keymaps
│   │   └── autocmds.lua    # Autocommands
│   └── plugins/            # Plugin configurations
│       ├── colorscheme.lua # Theme configuration
│       ├── editor.lua      # Editor enhancements
│       ├── go.lua          # Go language support
│       ├── keymaps.lua     # Additional keymaps
│       ├── mason.lua       # LSP and tools
│       ├── nvim-cmp.lua    # Completion
│       ├── python.lua      # Python language support
│       └── treesitter.lua  # Syntax highlighting
└── after/                  # Filetype-specific settings
    └── ftplugin/
        └── java.lua        # Java-specific settings
```

## 🎨 Features

### Core Features
- **LazyVim Base**: Built on top of LazyVim for a solid foundation
- **Lazy.nvim**: Fast plugin manager with lazy loading
- **Mason**: Easy installation of LSP servers, formatters, and linters
- **Treesitter**: Advanced syntax highlighting and text objects

### Language Support
- **Go**: Full Go development support with gopls, goimports, and gofumpt
- **Python**: Python development with pyright, black, isort, and venv-selector
- **Java**: Java development with jdtls and custom formatting
- **Web**: TypeScript, JavaScript, HTML, CSS with tsserver and prettier
- **Shell**: Bash, Zsh, Fish with shellcheck and shfmt
- **And more**: C/C++, Rust, PHP, Ruby, Scala, Kotlin

### Editor Enhancements
- **Gruvbox Theme**: Beautiful transparent theme
- **Auto-pairs**: Automatic bracket and quote pairing
- **Surround**: Easy text surrounding operations
- **Comment**: Smart commenting
- **Indent Guides**: Visual indent indicators
- **Auto-save**: Automatic saving on focus lost
- **Auto-format**: Format on save for supported languages

### Keymaps
- `<leader>gi`: Go organize imports
- `<leader>vs`: Select Python virtual environment
- `<leader>vc`: Select cached virtual environment
- `<leader>sr`: Search and replace with Spectre
- `<leader>fp`: Find plugin files
- `<leader>fr`: Find recent files
- `<leader>fg`: Find git files
- `<leader>bb`: Switch buffers

## 🚀 Getting Started

1. **Prerequisites**: Make sure you have Neovim 0.9+ installed
2. **Installation**: Clone this repository to `~/.config/nvim/`
3. **First Launch**: Run `nvim` and wait for plugins to install
4. **Mason Setup**: Run `:Mason` to install language servers and tools

## 📝 Customization

### Adding New Plugins
Create a new file in `lua/plugins/` with your plugin configuration:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  opts = {
    -- your options here
  },
}
```

### Language-Specific Settings
Add filetype-specific settings in `after/ftplugin/`:

```lua
-- after/ftplugin/rust.lua
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
```

### Keymaps
Add custom keymaps in `lua/config/keymaps.lua` or `lua/plugins/keymaps.lua`.

## 🔧 Troubleshooting

- **Slow startup**: Check `:Lazy profile` for slow plugins
- **LSP issues**: Run `:Mason` to ensure language servers are installed
- **Plugin conflicts**: Check `:Lazy log` for error messages

## 📚 Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
