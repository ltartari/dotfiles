set guifont=Menlo:h14

colorscheme solarized
set background=dark

" Disable toolbar
set guioptions=egmrt

" Command T
macmenu &File.New\ Tab key=<D-T>
map <D-t> :CommandT<CR>
imap <D-t> <Esc>:CommandT<CR>

" Command-Shift-F for Ack
map <D-F> :Ack<space>

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Open in full screen
macmenu Window.Toggle\ Full\ Screen\ Mode

" Set to full screen
set fuoptions=maxvert,maxhorz
au GUIEnter * set fullscreen
