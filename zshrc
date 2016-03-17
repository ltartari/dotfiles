#!/bin/zshrc

source $(brew --prefix)/share/antigen.zsh

# antigen use oh-my-zsh

# antigen bundle git
# antigen bundle command-not-found
# antigen bundle brew
# antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
antigen bundle osx
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle zsh-users/zaw

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# zsh env
[[ -f ~/.zshenv ]] && source ~/.zshenv
