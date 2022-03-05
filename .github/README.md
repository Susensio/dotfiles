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

Personal access token authentication must be [correctly configured](https://florianwinkelbauer.com/posts/2021-05-27-git-gnome-keyring/) in order to be saved and not prompted everytime.

``` bash
wget https://raw.githubusercontent.com/Susensio/dotfiles/master/.github/install.sh
bash install.sh
```

## Credits

* Git bare instructions:
[Nicola Paolucci](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
and
[Harfang's Perch](https://harfangk.github.io/2016/09/19/manage-dotfiles-with-a-git-bare-repository.html)
