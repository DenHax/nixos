require "nvchad.mappings"

-- local nomap = vim.keymap.del
--
-- nomap("n", "<C-a>")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map({ "n", "v" }, "=", "<C-a>", { desc = "Increment" })
map({ "n", "v" }, "-", "<C-x>", { desc = "Decriment" })
map({ "n", "v" }, "<C-a>", "<Nop>", { noremap = true, silent = true })
map({ "n", "v" }, "<C-x>", "<Nop>", { noremap = true, silent = true })

-- Personal keymaps
map("n", ";", ":")
map("i", "jj", "<Esc>", opts, { desc = "Exit from insert" }) -- exit
-- map("n", "<leader>sh", ":split<CR>", opts, { desc = "Horizontal split" })
-- map("n", "<leader>ss", ":vsplit<CR>", opts, { desc = "Vertical split" })
map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Tree and file explorers
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts, { desc = "Noe tree" })
map({ "n", "v" }, "<C-a>", "gg<S-v>G", { desc = "Select all text" })

-- Telescope
map("n", "<leader>fg", "<cmd> Telescope live_grep<cr>")

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format {}
end, { desc = "Formatting" })
