require "nvchad.mappings"

local map = vim.keymap.set

-- move lines up/down in normal and visual mode
map("n", "<M-Up>", ":m .-2<CR>==", { desc = "move line up" })
map("n", "<M-Down>", ":m .+1<CR>==", { desc = "move line down" })
map("v", "<M-Up>", ":m '<-2<CR>gv=gv", { desc = "move lines up" })
map("v", "<M-Down>", ":m '>+1<CR>gv=gv", { desc = "move lines down" })

-- split window
map("n", "<leader>sV", ":split<CR>", { desc = "split window horizontally" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "split window vertically" })

-- normal mode in terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "change to normal mode in terminal" })
