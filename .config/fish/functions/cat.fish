function cat --wraps=batcat --description 'Run batcat if installed' 
	if command -qs batcat
		batcat --plain --paging=never $argv
	else
		command cat $argv
	end
end
