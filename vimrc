set nocompatible  " be iMproved, required
filetype off      " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'https://github.com/chriskempson/vim-tomorrow-theme.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kien/ctrlp.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'junegunn/fzf'
Plugin 'git://github.com/csscomb/vim-csscomb.git'
Plugin 'https://github.com/atelierbram/vim-colors_duotones.git'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()           " required
filetype plugin indent on   " required

au BufNewFile,BufRead *.coffee.erb setf eruby.coffee

set background=dark
syntax on
colorscheme Tomorrow-Night-Eighties

set expandtab
set laststatus=2
set nowrap
set number
set shiftwidth=2
set softtabstop=2
set tabstop=2
set textwidth=0

set backupdir=~/.vim/backup
set directory=~/.vim/backup

set nobackup
set nowritebackup
set noswapfile

" Invisibles
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Invisible character colors
highlight NonText guifg=#174652
highlight SpecialKey guifg=#174652

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '›'
let g:airline_right_sep = '«'
let g:airline_right_sep = '‹'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = '·'
