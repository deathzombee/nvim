-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable mouse support
vim.opt.mouse = "a"

-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable sign column
vim.opt.signcolumn = "yes"

-- Enable cursor line
vim.opt.cursorline = true

-- Set tab settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Set search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Set file settings
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Set completion settings
vim.opt.completeopt = "menu,menuone,noselect"

-- Set terminal settings
vim.opt.termguicolors = true

-- Set scroll settings
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Set fold settings
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- Set clipboard settings
vim.opt.clipboard = "unnamedplus"
