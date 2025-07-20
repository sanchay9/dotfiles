autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git

# setup a hook that runs before every prompt
precmd_vcs_info() {
    vcs_info
}
precmd_functions+=(precmd_vcs_info)
setopt prompt_subst

+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true' ]] &&
        git status --porcelain | grep '??' &>/dev/null; then
        # This will show the marker if there are any untracked files in repo.
        hook_com[staged]+='?'
    fi
}

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "%F{blue}(%F{red}%m%u%c%F{yellow}%F{magenta} %b%F{blue})%{$reset_color%} "
# zstyle ':vcs_info:git:*' formats "%r/%S %b %m%u%c"

# PS1="%B%F{blue}[%F{white}%n%F{red}@%F{white}%m%F{blue}] %(?:%F{green}➜ :%F{red} )%F{cyan}%1~%b \$vcs_info_msg_0_"
# PS1="%B%F{red}[%F{yellow}%n%F{green}@%F{blue}%M %F{magenta}%1~%F{red}]%f$%b "
# PS1="\$vcs_info_msg_0_%F{red}%n@%F{blue}%m %F{yellow}%1~%f "
PS1="%B%F{magenta}%1~%b \${vcs_info_msg_0_}%(?.%F{green}❯.%F{red}❯)%f "
# PS1="%B%F{white}%1~%b \$vcs_info_msg_0_%(?.%F{red}%F{yellow}%F{green}.%F{red}%F{red}%F{red})%{$reset_color%} "

# source ~/.config/zsh/git-prompt.zsh

# shuf -n1 ~/docs/notes/words.md && printf "\n"
# ~/.config/scripts/colors/$(\ls ~/.config/scripts/colors | shuf -n1)

# eval "$(starship init zsh)"
