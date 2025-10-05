#!/bin/sh

function download() {
    mkdir -p ~/.stasel
    echo "Downloading files..."
    curl -SsL https://raw.githubusercontent.com/stasel/stasel/refs/heads/main/tools/.stasel/docker.sh > ~/.stasel/docker.sh
    curl -SsL https://raw.githubusercontent.com/stasel/stasel/refs/heads/main/tools/.stasel/linux.sh > ~/.stasel/linux.sh
    curl -SsL https://raw.githubusercontent.com/stasel/stasel/refs/heads/main/tools/.stasel/macOS.sh > ~/.stasel/macOS.sh
    curl -SsL https://raw.githubusercontent.com/stasel/stasel/refs/heads/main/tools/.stasel/shortcuts.sh > ~/.stasel/shortcuts.sh
    curl -SsL https://raw.githubusercontent.com/stasel/stasel/refs/heads/main/tools/.stasel/Brewfile > ~/.stasel/Brewfile
    echo "Done."
}

function addSourceIfNeeded() {
    local rcpath=$1
    if [ -f $rcpath ] && ! grep -q 'source ~/.shortcuts.sh' $rcpath ; then 
        echo $'\n# stasel additions\nsource ~/.shortcuts.sh\n' >> $rcpath
        echo "Installed aliases to $rcpath"
    fi
}

download
addSourceIfNeeded "$HOME/.zshrc"
addSourceIfNeeded "$HOME/.bashrc"
source ~/.shortcuts.sh