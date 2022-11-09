" Set line numbers and enable syntax highlight
syntax on
set number


" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4


" Enable mouse selection and clipboard
set mouse=v
set clipboard+=unnamedplus


" Color line numbers RED with root
let ppid=systemlist("awk '{print $4}' /proc/" . getpid() . "/stat")[0]
let ppname=systemlist("ps -p " . ppid . " -o comm=")[0]
if $USER == 'root' || ppname == 'sudoedit'
    highlight LineNr ctermfg=red
else
    highlight LineNr ctermfg=grey
endif


""""" Plugin manager vim-plug

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List plugins to be used
call plug#begin('~/.vim/plugged')

Plug 'dag/vim-fish'

call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

