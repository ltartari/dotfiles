typeset -U path

export PATH="/usr/local/bin:/usr/local/sbin:/$HOME/.bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

GPG_TTY=$(tty)
export GPG_TTY
