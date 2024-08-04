vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0

local opts = vim.opt

opts.number = true
opts.relativenumber = true

opts.swapfile = false
opts.encoding = "utf-8"
opts.clipboard = "unnamedplus"
-- opts.syntax = enable

opts.scrolloff = 8

opts.tabstop = 2
opts.softtabstop = 2
opts.shiftwidth = 2
opts.expandtab = true
opts.autoindent = true
opts.cursorline = true

-- spell
-- opts.spelling = "en_us"
-- opts.spelling = "ru_ru"
opts.spell = false
