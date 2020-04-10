" Set line numbers and enable syntax highlight
set number
syntax on

" Enable mouse selection
set mouse=a

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
