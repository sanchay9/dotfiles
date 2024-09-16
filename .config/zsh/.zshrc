#!/bin/zsh

HISTSIZE=25000 # Maximum events for internal history
SAVEHIST=25000 # Maximum events in history file
SUDO_PROMPT="give me %u's pass pls: "

setopt INTERACTIVE_COMMENTS
unsetopt PROMPT_CR PROMPT_SP

setopt INC_APPEND_HISTORY   # Immediately append to the history file, not when shell exits
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate
setopt HIST_SAVE_NO_DUPS    # Don't write duplicate entries
setopt HIST_IGNORE_SPACE    # Don't record an entry starting with space
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks before recording entry

if [[ $(uname -s) == 'Darwin' ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH=$PATH:$HOME/nvim/bin
    source "$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
    source "$(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
    source "/usr/share/doc/pkgfile/command-not-found.zsh" # requires pkgfile
    source "/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
    source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

source "${ZDOTDIR}/prompt.zsh"
source "${ZDOTDIR}/completions.zsh"
source "${ZDOTDIR}/vim.zsh"
source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/fzf.zsh"

bindkey '^E' autosuggest-clear
bindkey '^Y' forward-word
bindkey '^H' backward-kill-word # ctrl + backspace to delete word
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# clear backbuffer
clear-screen-and-scrollback() {
    printf '\x1Bc'
    zle clear-screen
    echo -ne '\e[5 q' # use beam shape cursor
}
zle -N clear-screen-and-scrollback
bindkey '^L' clear-screen-and-scrollback
