function ls --wraps=exa --description 'List contents in directory'
	if command -qs exa
		exa --group-directories-first $argv
	else
		source /usr/share/fish/functions/ls.fish
		ls $argv
	end
end
