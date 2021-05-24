function dotfiles --description 'Dotfiles repository'
    alias _dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

    if test $argv[1] = 'cmp'
        _dotfiles add -u
        _dotfiles commit -m $argv[2]
        _dotfiles push
    else
        _dotfiles $argv
    end
end


