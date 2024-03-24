# fzf booksmarks
b() {
    if ! command -v jq &>/dev/null; then
        echo 'jq not found, quitting'
        return
    fi

    bookmarks_path=~/.config/${CHROME_EXECUTABLE}/Default/Bookmarks

    jq_script='
    def ancestors: while(. | length >= 2; del(.[-1,-2]));
    . as $in | paths(.url?) as $key | $in | getpath($key) | {name,url, path: [$key[0:-2] | ancestors as $a | $in | getpath($a) | .name?] | reverse | join("/") } | .path + "/" + .name + "\t" + .url'

    jq -r "$jq_script" <"$bookmarks_path" | sed -E $'s/(.*)\t(.*)/\\1\t\x1b[36m\\2\x1b[m/g' | fzf --ansi | cut -d$'\t' -f2 | xargs google-chrome-beta
}

# fix ntfs effups
fixperm() {
    find . -type f -exec chmod --changes 644 {} +
    find . -type d -exec chmod --changes 755 {} +
}

# open in bg
open() {
    xdg-open "$@" &
}

alias q="exit"
alias pls="sudo"
alias ls="eza --icons --color=auto --group-directories-first --header"
alias tree="eza --tree --icons"
alias cat="bat"
alias du="ncdu --color=dark"
alias df="duf"
alias ps="procs"
alias wget="aria2c"
alias rm="rm -i"
alias v="nvim"
alias z=" tgpt"
alias nvim-startup="nvim --startuptime startuplog.txt +x && cat startuplog.txt && command rm startuplog.txt"
alias musopen="mpv 'https://live.musopen.org:8085/streamvbr0' --no-resume-playback"
alias cam="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed" # https://github.com/mpv-player/mpv/wiki/Video4Linux2-Input
alias myip="curl 'https://checkip.amazonaws.com'"
alias dots='git --git-dir ~/.dotfiles --work-tree ~'

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gd="git diff"

case "$(uname -s)" in
Darwin)
    alias pkgs="brew list | fzf --prompt='  ' --preview 'brew info {}'"
    ;;
Linux)
    alias pkgs="pacman -Qq | fzf --prompt='  ' --preview 'pacman -Qil {}'"
    alias d="dolphin . 2>/dev/null & disown"
    alias diskeyb="nohup evtest --grab /dev/input/event3 > /dev/null & disown"
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
    alias ssh="kitty +kitten ssh"
    alias clock="fs tty-clock -C 6 -c -b"
    ;;
*) ;;
esac
