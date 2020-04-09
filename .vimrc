" Set line numbers and enable syntax highlight
set number
syntax on

" Enable mouse selection
set mouse=a

" Enable undo after file write
if has('persistent_undo')
	set undofile
	silent !mkdir -p $HOME/.vim/undo
	set undodir=$HOME/.vim/undo
endif
