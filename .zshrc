setopt globdots nomatch menucomplete interactive_comments
zle_highlight=('paste:none') # dont hi after paste

# (cat ~/.cache/wal/sequences &)

# runcpp ()
# {
#     gcc -Wall "$1" -o a.out && ./a.out
#     notify-send "hi"
# }

x () {
    xset r rate 250 40
    setxkbmap -option caps:swapescape
}

# tty colors
if [ "$TERM" = "linux" ]; then
	printf %b '\e[40m' '\e[8]' # bg
	printf %b '\e[37m' '\e[8]' # fg
	printf %b '\e]P01e1e28'    # 'black'
	printf %b '\e]P8575268'    # 'bright-black'
	printf %b '\e]P1e38c8f'    # 'red'
	printf %b '\e]P9e38c8f'    # 'bright-red'
	printf %b '\e]P2b1e3ad'    # 'green'
	printf %b '\e]PAb1e3ad'    # 'bright-green'
	printf %b '\e]P3ebddaa'    # 'brown'
	printf %b '\e]PBebddaa'    # 'bright-brown'
	printf %b '\e]P4a4b9ef'    # 'blue'
	printf %b '\e]PCa4b9ef'    # 'bright-blue'
	printf %b '\e]P5e5b4e2'    # 'magenta'
	printf %b '\e]PDe5b4e2'    # 'bright-magenta'
	printf %b '\e]P6bee4ed'    # 'cyan'
	printf %b '\e]PEbee4ed'    # 'bright-cyan'
	printf %b '\e]P7c3bac6'    # 'white'
	printf %b '\e]PFdadae8'    # 'bright-white'
	clear
fi

HISTFILE=~/.cache/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
setopt INC_APPEND_HISTORY #Immediately append to the history file, not when shell exits
setopt HIST_IGNORE_ALL_DUPS  # Delete old recorded entry if new entry is a duplicate
setopt HIST_SAVE_NO_DUPS  # Don't record an entry that was just recorded again
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks

zmodload zsh/datetime
prompt_preexec() {
    prompt_prexec_realtime=${EPOCHREALTIME}
}

prompt_precmd() {
    if (( prompt_prexec_realtime )); then
        local -rF elapsed_realtime=$(( EPOCHREALTIME - prompt_prexec_realtime ))
        local -rF s=$(( elapsed_realtime%60 ))
        local -ri elapsed_s=${elapsed_realtime}
        local -ri m=$(( (elapsed_s/60)%60 ))
        local -ri h=$(( elapsed_s/3600 ))
        if (( h > 0 )); then
            printf -v prompt_elapsed_time '%ih%im' ${h} ${m}
        elif (( m > 0 )); then
            printf -v prompt_elapsed_time '%im%is' ${m} ${s}
        elif (( s >= 10 )); then
            printf -v prompt_elapsed_time '%.2fs' ${s} # 12.34s
        elif (( s >= 1 )); then
            printf -v prompt_elapsed_time '%.3fs' ${s} # 1.234s
        else
            printf -v prompt_elapsed_time '%ims' $(( s*1000 ))
        fi
        unset prompt_prexec_realtime
    else
        # Clear previous result when hitting ENTER with no command to execute
        unset prompt_elapsed_time
    fi
}

setopt nopromptbang prompt{cr,percent,sp,subst}
autoload -Uz add-zsh-hook
add-zsh-hook preexec prompt_preexec
add-zsh-hook precmd prompt_precmd

# git
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# show untracked files
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && git status --porcelain | grep -q '^?? ' 2> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked files in $PWD, use:
        # [[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='?'
    fi
}

zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "%F{blue}(%F{red}%m%u%c%F{yellow}%F{magenta} %b%F{blue})%f "

PS1="\$vcs_info_msg_0_"

# PS1="%B%F{blue}[%F{white}%n%F{red}@%F{white}%m%F{blue}] %(?:%F{green}-> :%F{red}-> )%F{cyan}%1~%f%b "
# PS1="%B%F{red}[%F{yellow}%n%F{green}@%F{blue}%M %F{magenta}%1~%F{red}]%f$%b "
# PS1="%F{red}%n@%F{blue}%m %F{yellow}%1~%f "
# PS1="%(?.%F{green}.%F{red}?%?) %B%F{cyan}%1~%f%b "
PS1+='%B%F{blue}%1~%b %f%b '
RPS1='%B%F{green}${prompt_elapsed_time}%f%b'
# RPS1='%*'


# vim mode
bindkey -v '^?' backward-delete-char
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

### aliases
alias q="exit"
function o() {
    xdg-open "$*" &
}
alias vim="nvim"
alias pacman="pacman --color=auto"
alias df="df -h" # disk usage
alias du="ncdu"
alias clock="tty-clock -C 6 -c -b"
alias d="dolphin . & disown"
alias cam="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed" # https://github.com/mpv-player/mpv/wiki/Video4Linux2-Input
alias hst="cat ~/.cache/zsh/history | sort | uniq | fzf --prompt='  ' | tr '\\n' ' ' | xclip -sel c"
alias pkgs="pacman -Qq | fzf --prompt='  ' --preview 'pacman -Qil {}'"
alias ls="exa --icons --color=auto --group-directories-first"
alias nvim-startup="nvim --startuptime startuplog.txt +x && cat startuplog.txt && rm startuplog.txt"
alias cat="bat"
alias rm="rm -i"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ~/.config/scripts/shell-color-scripts/$(\ls ~/.config/scripts/shell-color-scripts | shuf -n1)
~/.config/scripts/shell-color-scripts/blocks1

# autocomplete
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

bindkey "^ " forward-word
bindkey -M menuselect '^M' .accept-line

bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

bindkey -M menuselect '^n' vi-down-line-or-history
bindkey -M menuselect '^p' vi-up-line-or-history

shuf -n1 ~/docs/vimwiki/words.md
printf "\n"

# eval "$(starship init zsh)"
