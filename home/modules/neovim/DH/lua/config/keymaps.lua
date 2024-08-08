local keyset = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Personal keymaps
keyset("n", ";", ":")
keyset("i", "jj", "<Esc>", { desc = "Exit from insert" }) -- exit
keyset("n", "<leader>sh", ":split<CR>", opts, { desc = "Horizontal split" })
keyset("n", "<leader>ss", ":vsplit<CR>", opts, { desc = "Vertical split" })
keyset("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Tree and file explorers
keyset("n", "<leader>e", ":Neotree toggle<CR>", opts, { desc = "Noe tree" })
keyset("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

-- Remap default maps
keyset("n", "<C-h>", "<C-W>h", opts)
keyset("n", "<C-j>", "<C-W>j", opts)
keyset("n", "<C-k>", "<C-W>k", opts)
keyset("n", "<C-l>", "<C-W>l", opts)

-- Bufferline
keyset("n", "<S-h>", "<Cmd>bprev<CR>", opts)
keyset("n", "<S-l>", "<Cmd>bnext<CR>", opts)
keyset("n", "<leader>bc", "<Cmd>bdelete<CR>", opts)
-- Barbar keys
--
-- -- Move to previous/next
-- keyset("n", "<S-h>", "<Cmd>BufferPrevious<CR>", opts)
-- keyset("n", "<S-l>", "<Cmd>BufferNext<CR>", opts)
-- -- Re-order to previous/next
-- keyset("n", "<A-h>", "<Cmd>BufferMovePrevious<CR>", opts)
-- keyset("n", "<A-l>", "<Cmd>BufferMoveNext<CR>", opts)
-- -- Goto buffer in position...
-- keyset("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
-- keyset("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
-- keyset("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
-- keyset("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
-- keyset("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
-- keyset("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
-- keyset("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
-- keyset("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
-- keyset("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
-- keyset("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- -- Pin/unpin buffer
-- keyset("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- -- Close buffer
-- keyset("n", "<leader>bc", "<Cmd>BufferClose<CR>", opts)
-- -- Wipeout buffer
-- --                 :BufferWipeout
-- -- Close commands
-- --                 :BufferCloseAllButCurrent
-- --                 :BufferCloseAllButPinned
-- --                 :BufferCloseAllButCurrentOrPinned
-- --                 :BufferCloseBuffersLeft
-- --                 :BufferCloseBuffersRight
-- -- Magic buffer-picking mode
-- keyset("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- -- Sort automatically by...
-- keyset("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
-- keyset("n", "<leader>bn", "<Cmd>BufferOrderByName<CR>", opts)
-- keyset("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
-- keyset("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
-- keyset("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
--
-- -- Other:
-- -- :BarbarEnable - enables barbar (enabled by default)
-- -- :BarbarDisable - very bad command, should never be used
