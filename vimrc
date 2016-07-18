" Automatically setup Vundle on first run
if !isdirectory(expand("~/.vim/bundle/vundle"))
  call system("git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle")
endif

set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.fzf
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'airblade/vim-gitgutter'
Bundle 'ap/vim-css-color'
Bundle 'bling/vim-airline'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'https://github.com/chriskempson/vim-tomorrow-theme.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'myusuf3/numbers.vim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kien/ctrlp.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'junegunn/fzf'
Bundle 'git://github.com/csscomb/vim-csscomb.git'
Bundle 'https://github.com/atelierbram/vim-colors_duotones.git'
Bundle 'editorconfig/editorconfig-vim'


" Automatically install bundles on first run
if !isdirectory(expand("~/.vim/bundle/vim-airline"))
    execute 'silent BundleInstall'
    execute 'silent q'
endif

au BufNewFile,BufRead *.coffee.erb setf eruby.coffee

set background=dark
colorscheme Tomorrow-Night-Eighties


set expandtab
set laststatus=2
set noautoindent
set nowrap
set number
set norelativenumber
set shiftwidth=2
set softtabstop=2
set tabstop=2
set textwidth=0
syntax on

set nobackup
set nowritebackup
set noswapfile

" Invisibles
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Invisible character colors
highlight NonText guifg=#174652
highlight SpecialKey guifg=#174652

filetype plugin indent on

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
