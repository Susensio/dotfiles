# Navigation and listing
alias ls="ls --color -F"
alias ll="ls -lha"
alias la="ls -a"
alias cd..="cd .."


# Make cd only autocomplete directories
complete -d cd
complete -cf sudo

# Fix bluetooth connection problem
# pulseaudio-module-bluetooth must be apt installed
# script in https://gist.github.com/pylover/d68be364adac5f946887b85e6ed6e7ae
alias headphones="/usr/local/bin/a2dp.py 00:16:94:29:4F:47 -w 10"

# Python venv activation
alias venv="source ~/.venv/bin/activate"
alias jn="~/.venv/bin/jupyter notebook ~/Projects/playground/"


alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
