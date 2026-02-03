#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

alias ls="lsd -F"
alias la="lsd -AF"
alias ll="lsd -lAF --group-dirs=first"
alias lg="lsd -F --group-dirs=first"

export PATH="$PATH:/home/brian/bin"
export EDITOR="nvim"

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# uv
export PATH=$PATH:"$HOME/.local/bin"
eval "$(uv generate-shell-completion bash)"

# go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
. "$HOME/.cargo/env"

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# zoxide
eval "$(zoxide init --cmd cd bash)"

# OMP
eval "$(oh-my-posh init bash --config 'dracula')"
