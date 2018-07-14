typeset -U path

PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"
PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"
PATH="$HOME/.cargo/bin:$HOME:/usr/local/bin:/usr/local/sbin:$HOME/.bin:$PATH"
PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
PATH="/usr/local/opt/libpq/bin:$PATH"
GPG_TTY=$(tty)

export GPG_TTY PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
