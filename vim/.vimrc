" Vim config file

" ----------------------------------------------------------------
" General settings
" ----------------------------------------------------------------
set nocompatible      " turn off vi compatibility
set undolevels=420    " lots of undo
set history=42        " size of command history
" set modelines=20
" set modeline
set showcmd           " display incomplete commands
set shortmess+=O      " remove 'press ENTER or cmd' prompt
set wrap
set encoding=utf-8   
set laststatus=2      " show status line
set showmatch         " show matches on parens, brackets, etc.
" set ruler           " display colored column
" set colorcolumn=72  " column to color
set guicursor=n-c-v:block-nCursor
set listchars=space:.,tab:\│. " show . character to show spaces
set list			  " render the chars list
" set signcolumn=yes  " Always show the sign column

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
" set autoindent
set smartindent       " smart indent
" set expandtab       " enter spaces when tab is pressed

" ----------------------------------------------------------------
" mouse
" ----------------------------------------------------------------
set mouse=a           " enable mouse click

" ----------------------------------------------------------------
" colors & syntax
" ----------------------------------------------------------------
filetype plugin indent on
syntax on
colorscheme gruvbox
" colorscheme catppuccin_macchiato
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

" leader key
let mapleader = ' '

" ----------------------------------------------------------------
" Load Plugins
" ----------------------------------------------------------------
call plug#begin()

" vim airlines & theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" coc-vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nerd tree
Plug 'preservim/nerdtree'

" nerd commenter
Plug 'preservim/nerdcommenter'

" bufline
Plug 'ap/vim-buftabline'

" catppuccin theme
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" rustfmt
Plug 'rust-lang/rust.vim'

call plug#end()

" ----------------------------------------------------------------
" Configure plugin
" ----------------------------------------------------------------

" vim airline theme
let g:airline_theme='onedark'
" let g:airline_theme='catppuccin_mocha'
" let g:lightline = {'colorscheme': 'catppuccin_mocha'}

" nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>

" nerd commenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 0
let g:NERDToggleCheckAllLines = 1

" rustfmt
let g:rustfmt_autosave = 1

" coc
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" coc-pyright: https://github.com/fannheyward/coc-pyright
autocmd FileType python let b:coc_root_patterns = ['venv', '.venv', '.git']

" coc-rust-analyzer: https://github.com/fannheyward/coc-rust-analyzer

" coc-clangd: https://github.com/clangd/coc-clangd
" project setup: https://clangd.llvm.org/installation.html#project-setup


" ----------------------------------------------------------------
" keybindings
" ----------------------------------------------------------------

" move between buffer
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <leader>x :bd<CR>

" save buffer
nnoremap <silent> <C-s> :w!<CR>

" move lines
nnoremap <silent> <M-Up> :m .-2<CR>==
nnoremap <silent> <M-Down> :m .+1<CR>==
vnoremap <silent> <M-Up> :m '<-2<CR>gv=gv
vnoremap <silent> <M-Down> :m '>+1<CR>gv=gv

" toggle case
nnoremap <silent> <leader>t viw~`[
vnoremap <silent> <leader>t ~

" toggle comment
nnoremap <silent> <leader>/ :call nerdcommenter#Comment('n', 'toggle')<CR>
vnoremap <silent> <leader>/ :call nerdcommenter#Comment('n', 'toggle')<CR>

" base conversion
" nnoremap <silent> <leader>dx :s/\<\d\+\>/\=printf("0x%X", str2nr(submatch(0)))<CR>:nohlsearch<CR>
" nnoremap <silent> <leader>db :s/\<\d\+\>/\=printf("0b%b", str2nr(submatch(0)))<CR>:nohlsearch<CR>
" nnoremap <silent> <leader>hx :s/\<0x\x\+\>/\=str2nr(submatch(0), 16)<CR>:nohlsearch<CR>
" nnoremap <silent> <leader>bx :s/\<0b[01]\+\>/\=str2nr(submatch(0), 2)<CR>:nohlsearch<CR>

" vnoremap <silent> <leader>dx :s/\%V\d\+/\=printf("0x%X", str2nr(submatch(0)))<CR>:nohlsearch<CR>
" vnoremap <silent> <leader>db :s/\%V\d\+/\=printf("0b%b", str2nr(submatch(0)))<CR>:nohlsearch<CR>
" vnoremap <silent> <leader>hx :s/\%V0x\x\+/\=str2nr(submatch(0), 16)<CR>:nohlsearch<CR>
" vnoremap <silent> <leader>bx :s/\%V0b[01]\+/\=str2nr(submatch(0), 2)<CR>:nohlsearch<CR>

" create split
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

" move between splits
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l

" resize splits
noremap <S-Left> :vertical resize -1<CR>
noremap <S-Right> :vertical resize +1<CR>
noremap <S-Up> :resize -1<CR>
noremap <S-Down> :resize +1<CR>

" code diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)

" code navigation
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>fmt  <Plug>(coc-format-selected)
nmap <leader>fmt  <Plug>(coc-format-selected)

" code actions
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)
