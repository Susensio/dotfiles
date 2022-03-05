#!/usr/bin/env bash
shopt -s expand_aliases
alias _dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
git clone --bare https://github.com/Susensio/dotfiles.git $HOME/.dotfiles.git/
_dotfiles config --local status.showUntrackedFiles no
_dotfiles checkout 

if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
else
  echo "Backing up pre-existing dot files...";
  backupdir="$HOME/.dotfiles-backup/"
  echo $backupdir
  mkdir -p $backupdir
  files=`_dotfiles checkout 2>&1 | egrep "^\s+" | awk {'print $1'}`
  for file in $files; do
    mkdir -p "$backupdir$(dirname $file)"
    mv $file "$backupdir$file"
  done

  _dotfiles checkout
  if [ $? = 0 ]; then
    echo "Checked out dotfiles.";
  else
    echo "Error, repository cannot be cloned"
  fi;
fi;

unalias _dotfiles
