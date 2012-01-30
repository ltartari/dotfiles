set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle                       'gmarik/vundle'
Bundle                              'fugitive.vim'
Bundle                              'L9'
Bundle                              'FuzzyFinder'
Bundle        'git://git.wincent.com/command-t.git'
Bundle  'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle  'git://github.com/bbommarito/vim-slim.git'
Bundle       'git://github.com/tpope/vim-haml.git'
Bundle       'git://github.com/tpope/vim-rails.git'
Bundle       'git://github.com/tpope/vim-git.git'
Bundle    'git://github.com/msanders/snipmate.vim.git'
Bundle     'git://github.com/mileszs/ack.vim.git'
Bundle    'git://github.com/pangloss/vim-javascript.git'
Bundle      'git://github.com/kchmck/vim-coffee-script.git'
Bundle    'git://github.com/ervandew/supertab.git'
Bundle 'git://github.com/digitaltoad/vim-jade.git'
Bundle      'git://github.com/wavded/vim-stylus.git'
Bundle   'git://github.com/cakebaker/scss-syntax.vim.git'

set number
set ruler
syntax on
set background=dark
colorscheme solarized
set encoding=utf-8

" Whitespace stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:▸\ ,trail:·,eol:¬

"Invisible character colors
highlight NonText guifg=#073642
highlight SpecialKey guifg=#073642

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Command-T configuration
let g:CommandTMaxHeight=20

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup
filetype plugin indent on " required!

" excerpts from Coming home to Vim article
let mapleader = ","
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
nnoremap ; :
nnoremap <leader>w <C-w>v<C-w>l


set vb
set ch=2

set showmode

set nocursorline
set nocursorcolumn
