set nocompatible  " be iMproved, required
filetype off      " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/chriskempson/vim-tomorrow-theme.git'

Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'

Plugin 'othree/html5.vim'
Plugin 'slim-template/vim-slim'
Plugin 'digitaltoad/vim-jade'
Plugin 'slime-lang/vim-slime-syntax.git'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

Plugin 'kien/ctrlp.vim'
Plugin 'git://github.com/csscomb/vim-csscomb.git'

Plugin 'https://github.com/atelierbram/vim-colors_duotones.git'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'isRuslan/vim-es6'
Plugin 'mxw/vim-jsx'

Plugin 'vimwiki'


call vundle#end()           " required
filetype plugin indent on   " required

au BufNewFile,BufRead *.coffee.erb setf eruby.coffee " for coffescript syntax on erb files

syntax on
set background=dark
colorscheme Tomorrow-Night-Bright

set expandtab
set softtabstop=2
set tabstop=2

set laststatus=2 " force the display of the status line. required for vim-airline

set nowrap " don't break long text lines
set textwidth=0 " disable wrapping
set colorcolumn=80 " display ruler ideal max-width

set number " show line numbers
set shiftwidth=0 " don't assume indent on next line
set showmatch " highlight matching {[()]}

set backupdir=~/.vim/backup
set directory=~/.vim/backup

set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Invisibles
set list

highlight NonText guifg=#174652 " Invisible character colors
highlight SpecialKey guifg=#174652

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = '·'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
