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
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
git clone --bare git@github.com:Susensio/dotfiles.git $HOME/.dotfiles.git/
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout 

if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
else
  echo "Backing up pre-existing dot files...";
  mkdir -p .dotfiles-backup
  dotfiles checkout 2>&1 | egrep "^\s+" | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
  dotfiles checkout
  echo "Checked out dotfiles.";
fi;
```

## Credits

* Git bare instructions:
[Nicola Paolucci](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
and
[Harfang's Perch](https://harfangk.github.io/2016/09/19/manage-dotfiles-with-a-git-bare-repository.html)

* Chromium playback performance:
[Sergey Kovalenko](https://www.linkedin.com/pulse/how-get-smooth-youtubeflash-video-playback-raspberry-pi-kovalenko/)
