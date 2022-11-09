" Set line numbers and enable syntax highlight
syntax on
set number


" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4


" Enable mouse selection and clipboard
set mouse=a
set clipboard+=unnamedplus


" Color line numbers RED with root
let ppid=systemlist("awk '{print $4}' /proc/" . getpid() . "/stat")[0]
let ppname=systemlist("ps -p " . ppid . " -o comm=")[0]
if $USER == 'root' || ppname == 'sudoedit'
    highlight LineNr ctermfg=red
else
    highlight LineNr ctermfg=grey
endif

