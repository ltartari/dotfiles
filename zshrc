#!/bin/zshrc

fpath=(~/.zsh/functions $fpath)

autoload -U ~/.zsh/functions/*(:t)
autoload -U compinit && compinit
autoload -U colors && colors
autoload -Uz promptinit && promptinit

prompt off

setopt PROMPT_SUBST

typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

for zsh_source in $HOME/.zsh/*.zsh; do
  source $zsh_source
done

if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

export CC=/usr/bin/gcc-4.2

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

alias tmux="TERM=screen-256color-bce tmux"

source ~/nvm/nvm.sh
