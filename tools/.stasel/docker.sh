function dx() {
    docker exec -ti "$1" /bin/bash
}
alias dps="docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.State}}\t{{.Status}}\t{{.RunningFor}}'"
alias ds="docker start"
alias dst="docker stop"
alias dr="docker restart"
alias drm="docker rm"
alias drmf="docker rm -f"
alias dl="docker logs -f"

alias doco="docker compose"
alias docou='doco up -d'
alias docod='doco down'
alias docob='doco build'
alias docor='doco restart'

# Auto-completion setup
if command -v docker >/dev/null 2>&1; then
    if [ -n "${BASH_VERSION-}" ]; then
        complete -W "$(docker ps --format '{{.Names}}' 2>/dev/null)" ds dst dr drm drmf dl dx docou 2>/dev/null
    elif [ -n "${ZSH_VERSION-}" ]; then
        # Generate completion if _docker doesn't exist
        if ! whence -f _docker >/dev/null 2>&1; then
            if [ -d "${HOME}/.oh-my-zsh" ]; then
                comp_dir="${HOME}/.oh-my-zsh/completions"
            else
                comp_dir="${HOME}/.docker/completions"
                fpath=("$comp_dir" $fpath)
            fi
            mkdir -p "$comp_dir" && docker completion zsh > "$comp_dir/_docker" 2>/dev/null
            autoload -Uz compinit && compinit
        fi
        # Try Docker's built-in completion function
        if whence -f _docker_containers >/dev/null 2>&1; then
            for cmd in ds dst dr drm drmf dl dx docou; do
                compdef "_docker_containers" $cmd
            done
        fi
    fi
fi
