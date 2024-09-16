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
    --border=sharp"

FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"
FZF_ALT_C_OPTS="--preview 'eza --tree --icons {}'"
FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
FZF_CTRL_T_OPTS="--preview 'bat {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
if [[ $(uname -s) == 'Darwin' ]]; then
	FZF_CTRL_R_OPTS="--prompt '  ' --bind 'enter:execute-silent(echo -n {2..} | pbcopy)+abort'"
else
	FZF_CTRL_R_OPTS="--prompt '  ' --bind 'enter:execute-silent(echo -n {2..} | wl-copy)+abort'"
fi

CURR_MODE=$(jq -r '.["mode"]' ~/.cache/swcs.json)
if [ "$CURR_MODE" = "light" ]; then
	export FZF_DEFAULT_OPTS=" \
        --color=bg+:#ccd0da,bg:#eff1f6,spinner:#dc8a78,hl:#d20f39 \
        --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
        --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
else
	export FZF_DEFAULT_OPTS=" \
        --color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
        --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
        --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
        --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
fi

# --color=bg+:-1,fg:gray,fg+:white,border:black,spinner:black,hl:red,header:blue,info:green,pointer:white,marker:blue,prompt:gray,hl+:-1,input:cyan"

# 	export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
#
# 	export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# --color=fg:#3760bf,bg:#e1e2e7,hl:#b15c00 \
# --color=fg+:#3760bf,bg+:#c4c8da,hl+:#b15c00 \
# --color=info:#2e7de9,prompt:#007197,pointer:#007197 \
# --color=marker:#587539,spinner:#587539,header:#587539"
#
# 	export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# --color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
# --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
# --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
# --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
