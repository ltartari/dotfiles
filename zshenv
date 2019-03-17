typeset -U path

BROWSER="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"
PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
PATH="/usr/local/opt/libpq/bin:$PATH"
PATH="/usr/local/opt/python/libexec/bin:$PATH"
GPG_TTY=$(tty)
EDITOR="/usr/local/bin/mvim"

export GPG_TTY PATH BROWSER EDITOR

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
