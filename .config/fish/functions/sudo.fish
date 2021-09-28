# By Konrad Borowski | github.com/xfix
# Sudo wrapper, enables 'sudo !!' in Fish
function sudo --wraps sudo
	if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
