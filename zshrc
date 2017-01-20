#!/bin/zsh

source $(brew --prefix)/share/antigen/antigen.zsh
antigen init .antigenrc

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# zsh env
[[ -f ~/.zshenv ]] && source ~/.zshenv

# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

man() {
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  command man "$@"
}
