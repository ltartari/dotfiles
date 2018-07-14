set nocompatible " be iMproved, required
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

if has('nvim')
  set viminfo+=n~/.vim/nviminfo
else
  set viminfo+=n~/.vim/viminfo
endif

call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Colorscheme
Plugin 'rakr/vim-one'

" HTML, Slim
Plugin 'othree/html5.vim'
Plugin 'slim-template/vim-slim'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ruby/rails
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'

" CSS, Scss, Sass
Plugin 'ap/vim-css-color' " Displays colour preview
Plugin 'csscomb/vim-csscomb.git' " CSSComb
Plugin 'hail2u/vim-css3-syntax'

" JavaScript, React
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
" Plugin 'mxw/vim-jsx'

" Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Misc
Plugin 'editorconfig/editorconfig-vim'
Plugin 'google/vim-searchindex'
Plugin 'junegunn/fzf.vim'
" Plugin 'majutsushi/tagbar'
" Plugin 'tommcdo/vim-lion'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
" Plugin 'jbgutierrez/vim-better-comments'

" Plugin 'leafgarland/typescript-vim'

call vundle#end() " required
filetype plugin indent on " required

syntax on
set background=dark
colorscheme one

set autoread " Auto reload modified files

set autoindent " Always set autoindenting on
set smartindent " Set smart indenting
set expandtab " Expand Tabs to Spaces
set shiftwidth=2 " Number of columns to move at each indent level
set softtabstop=2 " Number of columns moved on a <tab> key
set tabstop=2 " Number of columns a Tab represents
set smarttab " Enable Smart tab'ing
" set textwidth=79 " Auto wrap at char 80
set nowrap " disable textwrap

set backspace=indent,eol,start " Allow backspace usage

set colorcolumn=80 " Add visual vertical ruler at column 80
set cursorline " Highlight current line

set number " Show line numbers
set numberwidth=5 " Numbers column width
set relativenumber

set showmatch " Highlight matching {[()]}

set backupdir=~/.vim/backup
set directory=~/.vim/backup

set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,space:· " Set characters for invisibles
set list " Show invisibles

set hlsearch " Highlight searched terms
set incsearch " Incremental search
set ignorecase " Ignore case when searching
set smartcase " Ignore ignorecase when search pattern contains uppercase chars

set wildmenu " Visual autocomplete for command menu

set foldenable " Enable folding
set foldlevelstart=10 " Open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=syntax " Fold based on syntax

set laststatus=2 " Force the display of the status line. * vim-airline

set showtabline=2 " force tab display at all times
set showcmd " display incomplete commands

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" Set correct filetype for slim files
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

""" REMAPS

" \b opens fzf buffers
nnoremap <silent> <leader>b :Buffers<cr>

" \t opens fzf files
nnoremap <silent> <leader>t :Files<cr>

" \r opens fzf tags
nnoremap <silent> <leader>r :Tags<cr>

" \f apply ALE fixers
nnoremap <silent> <leader>f :ALEFix<cr>


" RSpec.vim mappings
map <Leader>s :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>


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

" https://github.com/MaxMEllon/vim-jsx-pretty#configuration
let g:vim_jsx_pretty_enable_jsx_highlight = 1 " enable jsx
let g:vim_jsx_pretty_colorful_config = 1 " colorful style

" vim-lion space between alignment
let g:lion_squeeze_spaces = 1

" turn italics on for comments
let g:one_allow_italics = 1

" ale configuration
let g:ale_sign_error = '●'
let g:ale_sign_warning = '·'
let g:ale_lint_on_enter = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es6'
"let g:ale_fix_on_save = 1

" gruvbox config
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_hls_cursor='purple'

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

hi Terminal ctermbg=black guibg=black
nmap <Leader>A :below terminal ++close ++curwin<CR>
nmap <Leader>v :below terminal ++close ++rows=15<CR>

" persist fold state between sessions
" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent loadview
" augroup END

" Map bc to run CSScomb. bc stands for beautify css
autocmd FileType css noremap <buffer> <leader>bc :CSScomb<CR>
" Automatically comb your CSS on save
autocmd BufWritePre,FileWritePre *.css,*.scss silent! :CSScomb

set noballooneval " remove annoying panels on word hover

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
