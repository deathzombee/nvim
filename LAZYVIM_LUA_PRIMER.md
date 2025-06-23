# LazyVim & Neovim Lua Config Primer

## Why Lua for Neovim Config?
- **Speed:** Lua is lightweight and fast for embedding in C programs (like Neovim). For config, it's much faster than Vimscript. (But yes, Python is also fast for many things!)
- **Flexibility:** You can do anything from simple keymaps to advanced plugin logic.
- **Extensibility:** Plugins and user configs can interact programmatically.

> **Note:** If Lua looks odd or "funky" compared to other languages, you're not alone! Many people find its syntax and conventions unusual at first. This is normal, and you don't need to become a Lua expert to write good Neovim configs.

## Lua as a Config Language vs. Programming Language
- **Programming in Lua:**
  - Indexing starts at 1 (not 0).
  - **Tables** are the universal data structure: they can act as arrays, dictionaries, objects, or even custom data structures. (In other languages, you might use arrays, dicts, structs, or classes.)
  - You can define your own data structures, but most config is just tables and functions.
- **Configuring in Lua (for Neovim):**
  - You mostly write tables (lists/dictionaries/objects) and call functions.
  - You rarely write full programs—just describe what you want.
  - Many config files are just `return { ... }` with plugin specs or options.

## What is `require()`?
- `require()` is a built-in Lua function for loading modules (files or libraries).
- In Neovim config, `require("foo.bar")` loads the file `lua/foo/bar.lua` and returns whatever it `return`s.
- Example:
  ```lua
  -- loads lua/config/lazy.lua
  require("config.lazy")
  ```
- This is similar to `import` in Python or `require` in Node.js, but it always returns the value exported by the module (usually a table).

## Anatomy of a LazyVim/Lazy.nvim Config

### 1. **init.lua**
The entry point. Usually just:
```lua
require("config.lazy")
```

### 2. **lua/config/lazy.lua**
Bootstraps Lazy.nvim and sets up your plugin spec:
```lua
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  -- other options...
})
```

### 3. **lua/plugins/**
Each file returns a table describing a plugin or group of plugins:
```lua
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
      },
    },
  },
}
```

### 4. **Options and Keymaps**
Set options directly:
```lua
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
```
Keymaps:
```lua
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
```

### 5. **Autocommands**
```lua
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
```

## How Plugin Specs Work
- Each plugin is a table with at least the plugin repo string.
- You can add `opts`, `config`, `event`, `keys`, etc.
- Example:
```lua
return {
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
}
```

## Overriding/Extending LazyVim Defaults
- If you add a plugin in your user config that LazyVim already manages, your config takes precedence.
- You can add options, change keymaps, or disable plugins by setting `enabled = false`.

## Lua Table Basics for Config
- Tables are like `{}` in JSON, but can be lists, dictionaries, or both:
```lua
local list = { "a", "b", "c" }      -- list, indexed from 1
local dict = { foo = 1, bar = 2 }      -- dictionary
local mixed = { [1] = "a", foo = 2 }  -- both
```
- Access with `list[1]` or `dict.foo`.
- You can use tables to build any data structure, but for config, you mostly use them as lists or dictionaries.

## Common Gotchas
- **Indexing starts at 1:** `mylist[1]` is the first element (not 0!).
- **Commas are optional at the end of tables:** `{ a = 1, b = 2, }` is valid.
- **Functions can be inline:**
  ```lua
  opts = function(_, opts)
    opts.foo = true
    return opts
  end
  ```
- **Return at the end of plugin files:** Always `return { ... }`.

## Why `return { ... }` in Lua Config?
- In Neovim, each config file (module) is loaded with `require()` and must return a value.
- For plugin specs, you return a table describing the plugin(s).
- In Python, you might just write `return` or `return {}` (an empty dict), but in Lua, you almost always see `return { ... }` to export your config.
- Example:
  ```lua
  -- lua/plugins/myplugin.lua
  return {
    {
      "author/plugin",
      opts = { ... },
    },
  }
  ```

## If Lua Looks Weird, That's Normal!
- Lua's syntax and conventions are different from Python, JavaScript, or other languages.
- Tables do everything (arrays, dicts, objects, etc.), which can feel odd if you're used to more specialized data structures.
- The config style is more about describing what you want than writing a program.
- You don't need to learn all of Lua—just enough to read/write config tables and functions.

## Practical Tips
- **Copy and adapt:** Most config is copy-paste friendly. Adjust options as needed.
- **Use comments:** Lua uses `--` for comments.
- **Reloading:** Use `:Lazy reload` or restart Neovim after changes.
- **Debugging:** Use `:messages` or `print()` in Lua for debugging.
- **If you get stuck:** Look at examples, ask for help, or experiment—Lua is forgiving for config!

## Further Reading
- [Neovim Lua Guide](https://github.com/nanotee/nvim-lua-guide)
- [Lazy.nvim Docs](https://github.com/folke/lazy.nvim)
- [LazyVim Docs](https://lazyvim.github.io/)

---

**Bottom line:**
- You don't need to be a Lua expert to configure Neovim with LazyVim.
- Think of Lua config as describing what you want, not writing a full program.
- If it looks weird, that's normal—just focus on the patterns and copy/adapt as needed! 