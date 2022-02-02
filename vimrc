" remove all existing autocmds
autocmd!
scriptencoding utf-8
set encoding=utf-8
set nocompatible " be iMproved, required
filetype off " required!

set rtp+=/usr/local/opt/fzf

if has('nvim')
  set viminfo+=n~/.vim/nviminfo
else
  set viminfo+=n~/.vim/viminfo
endif

set path+=**

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Colorscheme
Plug 'joshdick/onedark.vim'

" HTML, Slim
Plug 'othree/html5.vim'
Plug 'slim-template/vim-slim'

" Git
Plug 'tpope/vim-fugitive'

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" CSS, Scss, Sass
Plug 'csscomb/vim-csscomb' " CSSComb
Plug 'hail2u/vim-css3-syntax'

" JavaScript, React, TypeScript
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
" Plug "mxw/vim-jsx"
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Misc
Plug 'dense-analysis/ale' " async linter
Plug 'editorconfig/editorconfig-vim'
Plug 'google/vim-searchindex' " show entries per search
Plug 'junegunn/fzf.vim' " find file in project
Plug 'RRethy/vim-illuminate' " highlight variable instances under the cursor
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Address reloading files opened
Plug 'tmux-plugins/vim-tmux-focus-events'

call plug#end()

set hidden

" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ }

" \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
" nnoremap <leader>cx :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <leader>rn :call LanguageClient#textDocument_rename()<CR>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

filetype plugin indent on " required

set mouse=a " enable mouse scroll

set autoread " Auto reload modified files

set re=1 " use old vim regex engine

set updatetime=10 " faster swap writing (default is 4k)

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
set listchars=tab:›\ ,trail:·,eol:$,nbsp:_,space:·

set hlsearch " Highlight searched terms
set incsearch " Incremental search
set ignorecase " Ignore case when searching
set smartcase " Ignore ignorecase when search pattern contains uppercase chars

set wildmode=longest,list " emacs like tab completion
set wildmenu " Visual autocomplete for command menu
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.pdf,*.psd
set wildignore+=*/node_modules/*

" Fix slow O inserts
set timeout
set timeoutlen=1000
set ttimeout
set ttimeoutlen=0

set modeline
set modelines=3

set foldlevelstart=10
set foldmethod=manual " Turn off syntax based folding
set nofoldenable " Disable folding

set laststatus=2 " Force the display of the status line. * vim-airline

set showtabline=2 " force tab display at all times
set showcmd " display incomplete commands
" set cmdheight=2

""" REMAPS

" \b opens fzf buffers
nnoremap <silent> <leader>b :Buffers<cr>

" \t opens fzf files
nnoremap <silent> <leader>t :GFiles<cr>

" possible fix for line breaks
inoremap <CR> <CR>x<BS>

" \f Call ALE fixers
nnoremap <leader>f :ALEFix<cr>

" disable baby mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <right> <Nop>

" toggle between current / previous edited file
nnoremap ,, <C-^>

" replace ex-mode with macro redo
nnoremap Q @@

" expand reference to current working dir
cnoremap <expr> %% expand('%:h').'/'

""" PLUGIN CONFIGURATION
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = '·'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'onedark'

" ALE configuration
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 0 " do not run fixers on save
let g:ale_lint_delay = 0
let g:ale_lint_on_enter = 0 " don’t run linters when opening a file
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_sign_column_always = 6

let g:ale_fixers = {
  \ 'javascript': ['prettier', 'eslint'],
  \ 'javascriptreact': ['prettier', 'eslint'],
  \ 'ruby': ['prettier', 'rubocop'],
  \ 'scss': ['prettier', 'csscomb', 'stylelint'] }

let g:ale_linters = {
  \ 'javascript': ['prettier', 'eslint'],
  \ 'javascriptreact': ['prettier', 'eslint'],
  \ 'ruby': ['prettier', 'rubocop'],
  \ 'scss': ['prettier', 'csscomb', 'stylelint'] }

" mark those pesky trailing whitespaces in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd FileType gitcommit set colorcolumn=73 textwidth=72
autocmd FileType ruby set colorcolumn=80
autocmd FileType md set colorcolumn=80
autocmd FileType js set colorcolumn=100 textwidth=100
autocmd FileType jsx set colorcolumn=100 textwidth=100
autocmd FileType javascriptreact set colorcolumn=100 textwidth=100

" Set correct filetype for slim files
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd FileType slim set colorcolumn=120 textwidth=120

autocmd BufEnter *.slim set colorcolumn=120
autocmd BufEnter *.jsx set colorcolumn=100

" Map bc to run CSScomb. bc stands for beautify css
autocmd FileType css noremap <buffer> <leader>bc :CSScomb<CR>

" jump to last line on file open
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

command! Vimrc :vs $MYVIMRC

" Copy to system
map <LEADER>y "*y

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

" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col
"         return "\<tab>"
"     endif
"     let char = getline('.')[col - 1]
"     if char =~ '\k'
"         " There's an identifier before the cursor, so complete the identifier.
"         return "\<c-p>"
"     else
"         return "\<tab>"
"     endif
" endfunction
" imap <expr> <tab> InsertTabWrapper()
" imap <s-tab> <c-n>

" block = normal / pipe = insert / underscore = replace
set guicursor=n-v-c:block,r-cr-o:hor20,i-ci-ve:ver25-Cursor-blinkwait0-blinkoff0-blinkon20-Cursor/lCursor

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

set ttyfast
syntax on
let g:onedark_terminal_italics = 1
let g:onedark_termcolors = 1
colorscheme onedark

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show autocomplete when Tab is pressed
" inoremap <silent><expr> <Tab> coc#refresh()
let g:vim_jsx_pretty_highlight_close_tag=1
let g:vim_jsx_pretty_colorful_config=1

set scrolloff=20
