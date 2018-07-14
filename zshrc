# keep line below for spotify error on login
export ZSH=~/.antigen/bundles/robbyrussell/oh-my-zsh

export PURE_PROMPT_SYMBOL=∴
source $(brew --prefix)/share/antigen/antigen.zsh
antigen init .antigenrc

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# zsh env
[[ -f ~/.zshenv ]] && source ~/.zshenv

# colored man pages
man() {
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  command man "$@"
}
