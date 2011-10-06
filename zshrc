#!/bin/zshrc

autoload -U compinit
compinit

for zsh_source in $HOME/.zsh/*.zsh; do
  source $zsh_source
done

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# zshenv
export NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules
