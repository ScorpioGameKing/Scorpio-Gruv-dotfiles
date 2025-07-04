-- Set Leader
vim.g.mapleader = " "

-- Open Netwrc
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Enable Shifting of selected text in Visual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Brings Line Below inline and keeps us at the start
vim.keymap.set("n", "J", "mzJ`z")

-- Keep us centered when jumping up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep us centered when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When in visual mode paste current buffer without overwriting it
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Allow Copying to the System Clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Void Deletes
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Centered Quick Fix List
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz")

-- Search and Replace
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Make Current Executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

