# dotfiles

Repository for saving and syncing config files between computers

## Fresh set up:

``` bash
git init --bare $HOME/.dotfiles.git
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.bash_aliases
source ~/.bashrc
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:Susensio/dotfiles.git
```

## Usage:

``` bash
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles push origin master
```

## Install to another system:

``` bash
source <(curl -sL https://raw.githubusercontent.com/Susensio/dotfiles/master/install.sh)
fi;
```

## Credits

* Git bare instructions:
[Nicola Paolucci](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
and
[Harfang's Perch](https://harfangk.github.io/2016/09/19/manage-dotfiles-with-a-git-bare-repository.html)
