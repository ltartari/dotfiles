#!/bin/zshrc

source $(brew --prefix)/share/antigen/antigen.zsh

antigen bundles <<EOBUNDLES
  compleat
  git-extras
  git-flow
  osx
  zsh-users/zsh-syntax-highlighting

  mafredri/zsh-async
  sindresorhus/pure
EOBUNDLES

antigen apply

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# zsh env
[[ -f ~/.zshenv ]] && source ~/.zshenv

# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
