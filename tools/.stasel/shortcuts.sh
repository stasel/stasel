#!/bin/sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias tools-update="curl -sSL https://raw.githubusercontent.com/stasel/stasel/main/tools/install.sh | bash"
alias so="ssh orion@orionet.nl"

# General shortcuts
alias ll="ls -lahG"
alias c="clear"
alias h='cd'
mkcd() { mkdir -p "$1" && cd "$1"; }
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias snano="sudo nano"
alias p="ping 1.1.1.1"

# git shortcuts
alias ad="git add ."
alias st="git status"
alias ck="git checkout"
alias br="git branch"
alias cm="git commit -m"
alias cma="git commit --amend"
alias cmaa="git commit --amend --no-edit"
alias lg="git log"
alias pu="git push"
alias pll="git pull"
alias PU="ad && cmaa && pu -f"

# npm shortcuts
alias ni="npm install"
alias NI="rm -rf node_modules package-lock.json && npm i"
alias nd="npm run dev"
alias ns="npm start"
alias nr="npm run"
alias nb="npm run build"
alias nt="npm test"

function cheat() {
    curl cht.sh/$1
}

function myip() {
  echo "Local:"
  if command -v ip &>/dev/null; then
    ip -o addr show up scope global | awk '{split($4,a,"/");printf "  - %-16s %s\n",a[1],$2}'
  else
    ifconfig 2>/dev/null | awk '/^[a-zA-Z0-9]/{iface=$1;sub(":$","",iface)} /inet6? / && $2!~/^fe80|127/ {printf "  - %-16s %s\n",$2,iface}'
  fi
  echo "Remote: "
  ip=$(curl -fsSL --max-time 5 ifconfig.co 2>/dev/null) || { echo "N/A"; return; }
  country=$(curl -fsSL --max-time 5 ifconfig.co/country 2>/dev/null) || { echo "Country unknown"; return; }
  echo "  - $ip [${country}]"
}

# OS-specific shortcuts
if [[ "$(uname -s)" == "Darwin" ]]; then
    source ~/.stasel/macOS.sh
elif [[ "$(uname -s)" == "Linux" ]]; then
    source ~/.stasel/linux.sh
fi

# Docker shortcuts
source ~/.stasel/docker.sh
