" ----------------------------------------------------------------
" Vim configuration
"
" Author: sparrowsurya
" ----------------------------------------------------------------

" ----------------------------------------------------------------
" General settings
" ----------------------------------------------------------------
set nocompatible      " turn off vi compatibility
set undolevels=420    " lots of undo
set history=42        " size of command history
set modelines=20
set modeline
set showcmd           " display incomplete commands
set shortmess+=O      " remove 'press ENTER or cmd' prompt
set wrap
set encoding=utf-8   
set laststatus=2      " show status line
set showmatch         " show matches on parens, brackets, etc.
" set ruler           " display colored column
" set colorcolumn=72  " column to color
set guicursor=n-c-v:block-nCursor

" ----------------------------------------------------------------
" swap file
" ----------------------------------------------------------------
set noswapfile        " do not create swap file
set nobackup          " do not keep backup

" ----------------------------------------------------------------
" number
" ----------------------------------------------------------------
set number            " show line number
set relativenumber    " show line number relative

" ----------------------------------------------------------------
" indentation
" ----------------------------------------------------------------
set softtabstop=4     
set tabstop=4
set shiftwidth=4
set shiftround        " indent/outdent to nearest tabstop
set autoindent
set smartindent       " smart indent
" set expandtab       " enter spaces when tab is pressed

" ----------------------------------------------------------------
" mouse
" ----------------------------------------------------------------
" set mouse=a         " enable mouse click

" ----------------------------------------------------------------
" colors & syntax
" ----------------------------------------------------------------
filetype on
syntax on
colorscheme gruvbox
set background=dark

" ----------------------------------------------------------------
" Search and Replace
" ----------------------------------------------------------------
set incsearch         " show match as search proceeds
set hlsearch          " highlight search patterns 
set ignorecase        " ignore case when searching
set smartcase         " ignore case unless captial in search
set nowrapscan        " do not wrap back to top of buffer

" ----------------------------------------------------------------
" Reformatting
" ----------------------------------------------------------------
set textwidth=72      " max width for text per line

" ----------------------------------------------------------------
" miscellaneous
" ----------------------------------------------------------------

" set syntax on non-standard files
au BufRead,BufNewFile *.pyi set filetype=python

" ----------------------------------------------------------------
" Load Plugins
" ----------------------------------------------------------------
call plug#begin()

" vim airlines & theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ----------------------------------------------------------------
" Configure plugin
" ----------------------------------------------------------------

" vim airline theme
let g:airline_theme='onedark'
