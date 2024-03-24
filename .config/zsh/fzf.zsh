if ! command -v fzf &>/dev/null; then
    exit
fi

if [[ $(uname -s) == 'Darwin' ]]; then
    source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
else
    source "/usr/share/fzf/completion.zsh"
    source "/usr/share/fzf/key-bindings.zsh"
fi

FZF_DEFAULT_OPTS="--prompt '∷ ' \
    --pointer '▶' \
    --marker ⇒ \
    --height 60% \
    --color=16 \
    --margin=1,3 \
    --layout=reverse \
    --info=inline \
    --border=sharp \
    --color=bg+:-1,fg:gray,fg+:white,border:black,spinner:black,hl:red,header:blue,info:green,pointer:white,marker:blue,prompt:gray,hl+:-1,input:cyan"

FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"
FZF_ALT_C_OPTS="--preview 'exa --tree --icons {}'"
FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
FZF_CTRL_T_OPTS="--preview 'bat {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
if [[ $(uname -s) == 'Darwin' ]]; then
    FZF_CTRL_R_OPTS="--prompt '  ' --bind 'enter:execute-silent(echo -n {2..} | pbcopy)+abort'"
else
    FZF_CTRL_R_OPTS="--prompt '  ' --bind 'enter:execute-silent(echo -n {2..} | wl-copy)+abort'"
fi
