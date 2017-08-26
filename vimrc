set nocompatible " be iMproved, required
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" colorscheme
Plugin 'rakr/vim-one'

" html, slim, jade, slime
Plugin 'digitaltoad/vim-jade'
Plugin 'othree/html5.vim'
Plugin 'slim-template/vim-slim'
Plugin 'slime-lang/vim-slime-syntax.git'

" git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ruby/rails
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" css, scss, sass
Plugin 'ap/vim-css-color'
Plugin 'csscomb/vim-csscomb.git'
Plugin 'hail2u/vim-css3-syntax'

" javascript/jsx
Plugin 'isRuslan/vim-es6'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'

" airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" misc
Plugin 'editorconfig/editorconfig-vim'
Plugin 'google/vim-searchindex'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tommcdo/vim-lion'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'

Plugin 'leafgarland/typescript-vim'

call vundle#end() " required
filetype plugin indent on " required

syntax on
colorscheme one
set background=dark

set autoread " auto reload modified files

set autoindent " Always set autoindenting on
set smartindent " Set smart indenting
set expandtab " Expand Tabs to Spaces
set shiftwidth=2 " Number of columns to move at each indent level
set softtabstop=2 " Number of columns moved on a <tab> key
set tabstop=2 " Number of columns a Tab represents
set smarttab " Enable Smart tab'ing
set textwidth=79 " Auto wrap at char 80

set backspace=indent,eol,start

set colorcolumn=80

set number " show line numbers
set numberwidth=5 " numbers column width
set relativenumber

set showmatch " highlight matching {[()]}

set backupdir=~/.vim/backup
set directory=~/.vim/backup

set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,space:· " set characters for invisibles
set list " show invisibles

set hlsearch " highlight searched terms
set incsearch " incremental search
set ignorecase " ignore case when searching
set smartcase " ignore ignorecase when search pattern contains uppercase chars

set wildmenu " visual autocomplete for command menu

set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

set laststatus=2 " force the display of the status line. * vim-airline

" don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

""" REMAPS
" \b toggle Tagbar
nnoremap <silent> <leader>b :TagbarToggle<cr>
" \. opens CtrlP
nnoremap <silent> <leader>. :CtrlPTag<cr>
" space toggle folds
nnoremap <space> za
" \f apply ALE fixers
nnoremap <silent> <leader>f :ALEFix<cr>

""" PLUGIN CONFIGURATION
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = '·'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="badwolf"
let g:jsx_ext_required = 0 " allow JSX in normal JS files

" ctrlp ignore folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tmp'

" vim-lion space between alignment
let g:lion_squeeze_spaces = 1

" turn italics on for comments
let g:one_allow_italics = 1

" ale configuration
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '✦'
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_fix_on_save = 1

" highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" width for commits
autocmd FileType gitcommit set colorcolumn=73
autocmd FileType gitcommit set textwidth=72
