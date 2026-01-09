if ! command -v fzf &>/dev/null; then
    exit
fi

source <(fzf --zsh)

if [[ $(uname -s) == 'Darwin' ]]; then
    copy_cmd="pbcopy"
else
    copy_cmd="wl-copy"
fi

FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
    --prompt ' ∷  ' \
    --style=minimal \
    --info=right \
    --height 60% \
    --margin=1,3 \
    --layout=reverse \
"

FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"
FZF_COMPLETION_OPTS='--border --info=inline'
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
FZF_CTRL_T_OPTS="
    --prompt '   '
    --walker-skip .git,node_modules,target,vendor
    --preview 'bat --style=plain --color=always {}'
    --bind 'alt-p:change-preview-window(hidden|)'
"
FZF_CTRL_R_OPTS="
    --prompt '   '
    --bind 'enter:execute-silent(echo -n {2..} | ${copy_cmd})+abort'
"
FZF_ALT_C_COMMAND="fd --prune --type d . . ~ ~/work ~/work/cx-core ~/dev ~/.config 2>/dev/null"
FZF_ALT_C_OPTS="
    --prompt '   '
    --bind 'alt-p:change-preview-window(hidden|)'
    --preview 'eza --tree --icons {}'
"

pkgs() {
    if [[ $(uname -s) == 'Darwin' ]]; then
        brew list | fzf --style=full --prompt='   ' --preview 'brew info {}'
    else
        pacman -Qq | fzf --style=minimal --prompt='   ' --preview 'pacman -Qil {}'
    fi
}

set-aws-profile() {
    export AWS_PROFILE=$(aws configure list-profiles | fzf \
        --style=minimal \
        --info=right \
        --height 60% \
        --margin=1,3 \
        --layout=reverse \
        --prompt " : ")
}

fzf_git_checkout_branch() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    branches=$(git branch "$@" --sort=-committerdate --sort=-HEAD --format=$'%(HEAD) %(color:yellow)%(refname:short) %(color:green)(%(committerdate:relative))%(color:reset)' --color=always | column -ts$'\t')
    current=$(git symbolic-ref --short HEAD)
    branch=$(
        echo "$branches" | grep -v "^$current$" | fzf +m \
            --ansi \
            --layout='reverse-list' \
            --header-lines 1 \
            --tiebreak begin \
            --color hl:underline,hl+:underline \
            --no-hscroll \
            --bind 'alt-p:change-preview-window(hidden|)' \
            --preview "git log -1 --date=short \$(cut -c3- <<< {} | cut -d' ' -f1) --" "$@" | sed 's/^\* //' | awk '{print $1}'
    )
    if [[ -n $branch ]]; then
        echo && git checkout "$branch" && zle reset-prompt
    fi
}
zle -N fzf_git_checkout_branch
bindkey '^[b' fzf_git_checkout_branch
