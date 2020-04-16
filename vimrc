" remove all existing autocmds
autocmd!
scriptencoding utf-8
set encoding=utf-8
set nocompatible " be iMproved, required
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

if has('nvim')
  set viminfo+=n~/.vim/nviminfo
else
  set viminfo+=n~/.vim/viminfo
endif

set path+=**

call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Colorscheme
Plugin 'rakr/vim-one'

" HTML, Slim
Plugin 'othree/html5.vim'
Plugin 'slim-template/vim-slim'

" Git
" Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" CSS, Scss, Sass
Plugin 'csscomb/vim-csscomb.git' " CSSComb
Plugin 'hail2u/vim-css3-syntax'
Plugin 'styled-components/vim-styled-components'

" JavaScript, React, TypeScript
" Plugin 'sheerun/vim-polyglot'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'

" Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Misc
Plugin 'editorconfig/editorconfig-vim'
Plugin 'google/vim-searchindex' " show how many entries were found for given search
Plugin 'junegunn/fzf.vim' " find file in project
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'dense-analysis/ale' " async linter
Plugin 'prettier/vim-prettier' " opinionated code formatter
Plugin 'RRethy/vim-illuminate' " highlight variable instances under the cursor

call vundle#end() " required
filetype plugin indent on " required

syntax on

if has("gui_running")
  set guifont=Iosevka\ Term\ Extralight:h18 " font
  set guicursor=n:blinkon0 " don’t blink in normal mode
  set guioptions=cegmr " disable toolbar
  set linespace=0 " reset linespace
  set visualbell " disable beeps
  set noballooneval " remove annoying panels on word hover
  highlight Comment cterm=italic gui=italic
  highlight SpecialComment cterm=italic gui=italic
  highlight gitcommitComment cterm=italic gui=italic
endif

set autoread " Auto reload modified files

set re=1 " use old vim regex engine

set termguicolors " true colors
set background=dark

set updatetime=1000 " faster swap writing (default is 4k)

" completion options
set completeopt=menu,preview

set autoindent " Always set autoindenting on
set nosmartindent " disable smart indenting
set nocindent " disable indent
set expandtab " Expand Tabs to Spaces
set shiftwidth=2 " Number of columns to move at each indent level
set softtabstop=2 " Number of columns moved on a <tab> key
set tabstop=2 " Number of columns a Tab represents
set smarttab " Enable Smart tab’ing
set nowrap " disable textwrap

set backspace=indent,eol,start " Allow backspace usage

set colorcolumn=80 " Add visual vertical ruler at column 80

set number " Show line numbers
set numberwidth=5 " Numbers column width
" set relativenumber

set showmatch " Highlight matching {[()]}

set lazyredraw " Macros execute faster

set nobackup nowritebackup " disable backup
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Invisibles
set list
set listchars=tab:›\ ,trail:·,eol:¬,nbsp:_,space:·

set hlsearch " Highlight searched terms
set incsearch " Incremental search
set ignorecase " Ignore case when searching
set smartcase " Ignore ignorecase when search pattern contains uppercase chars

set wildmode=longest,list " emacs like tab completion
set wildmenu " Visual autocomplete for command menu
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*

" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

set modeline
set modelines=3

set foldlevelstart=10
set foldmethod=syntax " Turn off syntax based folding
set nofoldenable " Disable folding

set laststatus=2 " Force the display of the status line. * vim-airline

set showtabline=2 " force tab display at all times
set showcmd " display incomplete commands

" Set correct filetype for slim files
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

""" REMAPS

" \b opens fzf buffers
nnoremap <silent> <leader>b :Buffers<cr>

" \t opens fzf files
nnoremap <silent> <leader>t :Files<cr>

" possible fix for line breaks
inoremap <CR> <CR>x<BS>

" \f Call ALE fixers
nnoremap <silent> <leader>f :ALEFix<cr>

" \p Call Prettier
nnoremap <silent> <leader>p :PrettierAsync<cr>

""" PLUGIN CONFIGURATION
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = '·'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="one"

" ALE configuration
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\ 'javascript': [],
\ 'typescript': ['tsserver'],
\ 'typescript.tsx': ['tsserver']
\ }
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'javascriptreact': ['prettier', 'eslint'],
\ 'typescript': ['tsserver'],
\ 'typescript.tsx': ['tsserver'],
\ 'ruby': ['rubocop']
\}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_enter = 0 " don’t run linters when opening a file
let g:ale_fix_on_save = 0 " run fixers on save
let g:ale_lint_delay = 0
let g:ale_sign_column_always = 1
let g:tsuquyomi_disable_quickfix = 1

" highlight those pesky trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd FileType gitcommit set colorcolumn=73
autocmd FileType gitcommit set textwidth=72
autocmd FileType ruby set colorcolumn=80
autocmd FileType md set colorcolumn=80
autocmd FileType js,jsx set colorcolumn=100

highlight Terminal ctermbg=black guibg=black
nmap <Leader>A :below terminal ++close ++curwin<CR>
nmap <Leader>v :below terminal ++close ++rows=15<CR>

" Map bc to run CSScomb. bc stands for beautify css
autocmd FileType css noremap <buffer> <leader>bc :CSScomb<CR>

" Automatically comb your CSS on save
autocmd BufWritePre,FileWritePre *.css,*.scss silent! :CSScomb

" jump to last line on file open
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" disable baby mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <right> <Nop>

" Close all other splits
nnoremap <leader>o :only<cr>

" replace ex-mode with macro redo
nnoremap Q @@

command! Vimrc :vs $MYVIMRC

" toggle between current / previous edited file
nnoremap ,, <C-^>

" expand reference to current working dir
cnoremap <expr> %% expand('%:h').'/'

" Promote variable to rspec let
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" block = normal / pipe = insert / underscore = replace
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

colorscheme one
let g:one_allow_italics = 1
" turn italics on for comments
highlight Comment cterm=italic gui=italic
highlight SpecialComment cterm=italic gui=italic
highlight gitcommitComment cterm=italic gui=italic
highlight vimLineComment cterm=italic gui=italic
