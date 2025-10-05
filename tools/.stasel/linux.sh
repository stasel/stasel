alias flush-dns="sudo systemd-resolve --flush-caches && echo 'Flushed DNS'"
alias lock="loginctl lock-session $(loginctl list-sessions | grep seat | awk '{print $1}')"
alias unlock="loginctl unlock-session $(loginctl list-sessions | grep seat | awk '{print $1}')"
alias up="sudo apt update && sudo apt upgrade -y"

function vnc() {
    x11vnc -display :0 -noxrecord -noxfixes -noxdamage -forever -passwd $1 -rfbport 5900
}

# Raspberry pi
if [ -f /opt/vc/bin/vcgencmd ]; then
	alias pitemp="while true; do /opt/vc/bin/vcgencmd measure_temp; sleep 1; done"
fi
