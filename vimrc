set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'vim-scripts/jade.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ap/vim-css-color'
Bundle 'pangloss/vim-javascript'
Bundle 'slim-template/vim-slim'
Bundle 'othree/html5.vim'
Bundle 'bling/vim-airline'
Bundle 'myusuf3/numbers.vim'
Bundle 'https://github.com/chriskempson/vim-tomorrow-theme.git'
Bundle 'junegunn/goyo.vim'
Bundle 'bling/vim-airline'

colorscheme Tomorrow-Night

set nocursorline
set nocursorcolumn
set number
syntax on
set encoding=utf-8

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set textwidth=0
set colorcolumn=0

set backupdir=~/.vim/backup
set directory=~/.vim/backup

set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Invisibles
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Invisible character colors
highlight NonText guifg=#073642
highlight SpecialKey guifg=#073642

set nocursorline
set nocursorcolumn

filetype plugin indent on

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
