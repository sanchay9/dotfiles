y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

g() {
    if [[ $# -gt 0 ]]; then
        git "$@"
    else
        git status
    fi
}

jwt() {
    jq -R 'split(".") |.[0:2] | map(gsub("-"; "+") | gsub("_"; "/") | gsub("%3D"; "=") | @base64d) | map(fromjson)' <<<$1
}

# fix ntfs effups
fixperm() {
    find . -type f -exec chmod --changes 644 {} +
    find . -type d -exec chmod --changes 755 {} +
}

validateYaml() {
    python3 -c 'import yaml,sys;yaml.safe_load(sys.stdin)' <$1
}

alias q="exit"
alias pls="sudo"
alias ls="eza --icons --color=auto --group-directories-first --header"
alias la="eza --icons --color=auto --group-directories-first --header -a"
alias ll="eza --icons --color=auto --group-directories-first --header -la"
alias mkdir="mkdir -p"
alias tree="eza --tree --icons"
alias cat="bat"
alias du="ncdu --color=dark"
alias df="duf"
alias ps="procs"
alias wget="aria2c"
alias rm="rm -i"
alias v="nvim"
alias myip="curl 'https://checkip.amazonaws.com'"
alias aws-set-profile='export AWS_PROFILE=$(aws configure list-profiles | fzf --prompt "AWS profile:")'
alias dots='git --git-dir $HOME/.dotfiles --work-tree $HOME'
alias dotse='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'

case "$(uname -s)" in
Darwin)
    alias brewsync="brew update && brew bundle install --cleanup --file=~/Brewfile && brew upgrade"
    ;;
Linux)
    open() {
        xdg-open "$@" &
    }
    alias d="dolphin . 2>/dev/null & disown"
    alias diskeyb="nohup evtest --grab /dev/input/event3 > /dev/null & disown"
    alias cam="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed" # https://github.com/mpv-player/mpv/wiki/Video4Linux2-Input
    ;;
esac

case "$TERM" in
xterm-kitty)
    fs() {
        kitty @ set-spacing padding=0
        "$@"
        kitty @ set-spacing padding=default
    }

    alias nvim="fs nvim"
    alias btop="fs btop"
    alias tt="fs tt -notheme -quotes en"
    alias clock="fs tty-clock -C 6 -c -b"
    alias ssh="kitty +kitten ssh"
    ;;
*) ;;
esac
