# Dotfiles repository
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
dotfiles pull &> /dev/null & disown

# Navigation and listing
alias ls="ls --color -F"
alias ll="ls -lha"
alias la="ls -a"
alias lt='ls --human-readable --size -1 -S --classify | more'

alias cd..="cd .."

# Colour without filtering
grepc () {
	pattern=$1
	file=$2
	grep -E "$pattern|$" $file
}

alias mnt='mount | grep -E ^/dev | column -t'


# Make cd only autocomplete directories and fix sudo
complete -d cd
#complete -cf sudo


# Python venv activation
alias venv="source ~/.venv/bin/activate"


# If local aliases found, source it
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi
