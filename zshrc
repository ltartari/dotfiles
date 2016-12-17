#!/bin/zshrc

source $(brew --prefix)/share/antigen/antigen.zsh
antigen init .antigenrc

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# zsh env
[[ -f ~/.zshenv ]] && source ~/.zshenv

# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
