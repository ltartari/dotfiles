#!/bin/zshrc

source /usr/local/Cellar/antigen/1/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle command-not-found
antigen bundle brew
antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
antigen bundle osx
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

antigen theme https://gist.github.com/ltartari/0de75ffe1424ac0e6389 ltartari

antigen apply

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
