set showmatch
set hlsearch
set incsearch
set wildmode=longest,list
set number
filetype plugin indent on
syntax on
set mouse=a
filetype plugin on
set cursorline
set ttyfast

call plug#begin()
    Plug 'tikhomirov/vim-glsl'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'terryma/vim-smooth-scroll'
    Plug 'f-person/git-blame.nvim'
    Plug 'xiyaowong/transparent.nvim'
call plug#end()

noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
colorscheme catppuccin-macchiato
