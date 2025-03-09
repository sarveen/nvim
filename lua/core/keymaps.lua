vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "//", ":noh<CR>:", opts)
