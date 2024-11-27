require "nvchad.options"

-- mouse
vim.o.mouse = "a"

-- cursor
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hov20"

-- indentation
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true

-- line numbering
vim.o.number = true
vim.o.relativenumber = true

-- line
vim.o.textwidth = 72
vim.o.wrap = true

-- colors
vim.o.termguicolors = true

-- shell
vim.o.shell = vim.env.SHELL or vim.fn.expand("$SHELL")

-- Miscellanious
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
vim.cmd("autocmd BufRead,BufNewFile *.pyi set filetype=python")
