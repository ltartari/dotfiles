typeset -U path

PATH="/usr/local/bin:/usr/local/sbin:$HOME/.bin:$PATH"
GPG_TTY=$(tty)
export GPG_TTY PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
