alias flush-dns="sudo killall -HUP mDNSResponder && echo 'Flushed DNS'"
alias up="brew update && brew upgrade && brew autoremove && brew cleanup"

function spell() {
    local word=$1
    for (( i=0; i<${#word}; i++ )); do
        letter="${word:$i:1}"
        say -v "Daniel" "$letter"
        echo -n "$letter "
    done
}

# Xcode
function x() {
    local xcworkspace=$(find . -iregex '.*\.xcworkspace' -maxdepth 1 -print -quit)
    echo ${xcworkspace}
    open ${xcworkspace}
}
alias ddd="rm -rf ~/Library/Developer/Xcode/DerivedData/*"

