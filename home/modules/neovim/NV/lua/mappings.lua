require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Personal keymaps
map("n", ";", ":")
map("i", "jj", "<Esc>", opts, { desc = "Exit from insert" }) -- exit
map("n", "<leader>sh", ":split<CR>", opts, { desc = "Horizontal split" })
map("n", "<leader>ss", ":vsplit<CR>", opts, { desc = "Vertical split" })
map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Tree and file explorers
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts, { desc = "Noe tree" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

-- Telescope
map("n", "<leader>fg", "<cmd> Telescope live_grep<cr>")
