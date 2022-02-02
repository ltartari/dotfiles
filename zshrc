# Allow bypass for commands that start with an empty space " "
setopt HIST_IGNORE_SPACE

# Enable showing stash state for git repos
zstyle :prompt:pure:git:stash show yes

# Enable antigen
source $(brew --prefix)/share/antigen/antigen.zsh
antigen init $HOME/.antigenrc

# Use emacs movement
set -o emacs

# load aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Allow use of C-x C-e to edit the current command
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Enable comments
setopt interactivecomments

# Man pages… in colour (cue police squad theme)
man() {
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  command man "$@"
}

# Enable rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Enable FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Override path stuff
path+=("/usr/local/opt/libpq/bin")
path+=("/usr/local/sbin")

# Add any local ./bin folder to the path
path=("./bin" ${path:#${dir}})

# Deduplicate path items
typeset -U path

# let ruby know to use openssl version 1.1 from brew
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
