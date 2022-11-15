function bat --description 'Alternative to cat, with default options'
    set -l opt -p
	command batcat $opt $argv
end
