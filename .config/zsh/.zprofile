export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

export CARGO_HOME=$XDG_DATA_HOME/cargo
export GOPATH=$XDG_DATA_HOME/go
export GOBIN=$XDG_DATA_HOME/go/bin
export GOPRIVATE=github.com/angel-one
export NODE_REPL_HISTORY=$XDG_CACHE_HOME/node_repl_history
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config

export PATH=$PATH:$HOME/.local/bin:$GOBIN:$CARGO_HOME/bin:$HOME/.config/scripts

export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'
export MANWIDTH=999

if [[ $(uname -s) == 'Darwin' ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
    export GPG_TTY=$(tty)
    export SSH_ASKPASS=/usr/lib/seahorse/ssh-askpass
    export SSH_ASKPASS_REQUIRE=prefer

    # Autostart Hyprland on TTY1
    if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
        start-hyprland
    fi
fi
