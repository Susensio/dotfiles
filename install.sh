#!/usr/bin/env bash
alias _dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
git clone --bare git@github.com:Susensio/dotfiles.git $HOME/.dotfiles.git/
_dotfiles config --local status.showUntrackedFiles no
_dotfiles checkout 

if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
else
  echo "Backing up pre-existing dot files...";
  mkdir -p .dotfiles-backup
  _dotfiles checkout 2>&1 | egrep "^\s+" | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
  _dotfiles checkout
  echo "Checked out dotfiles.";
fi;
