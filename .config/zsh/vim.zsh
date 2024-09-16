bindkey -v
export KEYTIMEOUT=1
bindkey -v '^?' backward-delete-char # required for backspace to work properly

# cursor shape for different vi modes.
zle-keymap-select() {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;         # block
        viins|main|'') echo -ne '\e[5 q';; # beam
    esac
}

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -v` has been set elsewhere)
    echo -ne '\e[5 q'
}

zle -N zle-keymap-select
zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# text objects for quotes and brackets
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
    bindkey -M $km -- '-' vi-up-line-or-history
    for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
        bindkey -M $km $c select-quoted
    done
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $km $c select-bracketed
    done
done

# surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround
