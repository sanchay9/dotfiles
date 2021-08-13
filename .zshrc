setopt globdots nomatch menucomplete interactive_comments
zle_highlight=('paste:none')         # dont hi after paste

# autocomplete
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
bindkey "^ " forward-word

bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^M' .accept-line

# colors
autoload -Uz colors && colors

# history stuff
HISTFILE=~/.cache/zsh/history
HISTSIZE=5000
SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

# prompt
PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}-> :%{$fg_bold[red]%}-> )%{$fg[cyan]%}%c%{$reset_color%}"

# git
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
#
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"
PROMPT+="\$vcs_info_msg_0_ "

# vim mode
bindkey -v '^?' backward-delete-char
export KEYTIMEOUT=1

### aliases
alias vim="nvim"
alias df='df -h' # disk usage
alias clock='tty-clock -C 6 -c -b'

# colorize
alias s='cd /mnt/WindowsD/Sanchay'
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ~/.config/scripts/shell-color-scripts/$(ls ~/.config/scripts/shell-color-scripts | shuf -n1)
~/.config/scripts/shell-color-scripts/panes
