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

# Autoupdate dotfiles, avoid password prompt if no ssh-agent is running
if [ -n "$SSH_AUTH_SOCK" ]; then
	dotfiles pull &> /dev/null & disown
fi

# Upgrade system
alias upgrade="sudo apt update && 
sudo apt full-upgrade -y && 
sudo apt autoremove -y && 
sudo apt autoclean -y"

alias aptpurge="dpkg -l | grep '^rc' | awk '{print $2}' | xargs dpkg --purge"

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


# Python venv activation
alias venv="source ~/.venv/bin/activate"


# If local aliases found, source it
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi


# Add tldr autocompletion
if command -v tldr &> /dev/null
then
    complete -W "$(tldr 2>/dev/null --list)" tldr
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



## Load environment variables
#if [ -f ~/.env ]; then
#    export $(cat .env | xargs)
#fi
