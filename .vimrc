" Set line numbers and enable syntax highlight
syntax on
set number
" Color line numbers RED with root
if $USER == 'root'
	highlight LineNr ctermfg=red
else
	highlight LineNr ctermfg=grey
endif

set title
set bg=dark

" Enable mouse selection and clipboard
set mouse=a
set clipboard=unnamedplus,autoselect

" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4

" Enable undo after file write
if has('persistent_undo')
	set undofile
	silent !mkdir -p $HOME/.vim/undo
	set undodir=$HOME/.vim/undo//
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Shortcuts for fast typing mistakes
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Enable block selection with mouse
noremap <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap <M-LeftDrag> <LeftDrag>
inoremap <M-LeftDrag> <LeftDrag>
onoremap <M-LeftDrag> <C-C><LeftDrag>
