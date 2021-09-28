# By Moritz Kneilmann | github.com/MoritzKn
function bak --desc "Adds the sufix '.bak' (backup) to files"
    for file in $argv
        cp $file $file.bak
    end
end
