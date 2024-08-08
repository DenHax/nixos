require "nvchad.options"

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.swapfile = false
opt.encoding = "utf-8"
opt.clipboard = "unnamedplus"

opt.scrolloff = 8

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.cursorline = true
