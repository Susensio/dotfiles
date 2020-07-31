# Dotfiles repository
alias _dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
dotfiles () { 
	if [ "$1" == "cmp" ]; then
		_dotfiles add -u
		_dotfiles commit -m "$2"
		_dotfiles push
	else
		_dotfiles "$@"
	fi
}
dotfiles pull &> /dev/null & disown

# Navigation and listing
alias ls="ls --color -F"
alias ll="ls -lha"
alias la="ls -a"
alias lsize='ls --human-readable --size -1 -S --classify | more'

alias cd..="cd .."

# Colour without filtering
grepc () {
	pattern=$1
	file=$2
	grep -E "$pattern|$" $file
}

# Only mounted devices
alias mnt='mount | grep -E ^/dev | column -t'


# Forward X11 in trusted mode, allows clipboard sharing on remote server
alias ssh='ssh -Y'


# Make cd only autocomplete directories and fix sudo
complete -d cd
#complete -cf sudo


# Python venv activation
alias venv="source ~/.venv/bin/activate"


# If local aliases found, source it
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi


# Explain shell commands using explainshell.com
explain () {
  if [ "$#" -eq 0 ]; then
    while read  -p "Command: " cmd; do
      curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$cmd"
    done
    echo "Bye!"
  elif [ "$#" -eq 1 ]; then
    curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$1"
  else
    echo "Usage"
    echo "explain                  interactive mode."
    echo "explain 'cmd -o | ...'   one quoted command to explain it."
  fi
}
