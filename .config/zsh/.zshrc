#!/bin/zsh

SUDO_PROMPT="give me %u's pass pls: "

setopt INTERACTIVE_COMMENTS
unsetopt PROMPT_CR PROMPT_SP

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=25000
SAVEHIST=${HISTSIZE}
setopt hist_ignore_all_dups hist_ignore_space inc_append_history share_history hist_save_no_dups

if [[ $(uname -s) == 'Darwin' ]]; then
    source "$HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
    source "/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" 2>/dev/null
    source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" 2>/dev/null
fi

export ANTHROPIC_BASE_URL=https://pragya-api.angelone.in/
export ANTHROPIC_SMALL_FAST_MODEL=claude-3-haiku
export ANTHROPIC_DEFAULT_HAIKU_MODEL=claude-3-haiku
export ANTHROPIC_MODEL="claude-4-5-opus"
export NODE_TLS_REJECT_UNAUTHORIZED=0

if [[ -f "${ZDOTDIR}/secrets.zsh" ]]; then
    source "${ZDOTDIR}/secrets.zsh"
else
    local secrets_file="${ZDOTDIR}/secrets.zsh"
    {
        echo "# Verified secrets cache generated on $(date)"
        echo "export LEETCODE_SESSION='$(pass show LEETCODE_SESSION 2>/dev/null || true)'"
        echo "export LEETCODE_CSRF='$(pass show LEETCODE_CSRF 2>/dev/null || true)'"
        echo "export AOC_COOKIE='$(pass show AOC_COOKIE 2>/dev/null || true)'"
        echo "export ANTHROPIC_AUTH_TOKEN='$(pass show ANTHROPIC_AUTH_TOKEN 2>/dev/null || true)'"
        echo "export GEMINI_API_KEY='$(pass show GEMINI_API_KEY 2>/dev/null || true)'"
        echo "export GOOGLE_GENERATIVE_AI_API_KEY=\$GEMINI_API_KEY"
    } >"$secrets_file"
    source "$secrets_file"
    echo "Secrets refreshed and cached to $secrets_file."
fi

source "${ZDOTDIR}/prompt.zsh"
source "${ZDOTDIR}/completions.zsh"
source "${ZDOTDIR}/vim.zsh"
source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/fzf.zsh"

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
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
