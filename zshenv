typeset -U path

KEYTIMEOUT=1
BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"
EDITOR="/usr/local/bin/mvim"
FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
GPG_TTY=$(tty)
PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"
PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
PATH="/usr/local/opt/libpq/bin:$PATH"
PATH="/usr/local/opt/python/libexec/bin:$PATH"
OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export BROWSER EDITOR FZF_DEFAULT_COMMAND GPG_TTY PATH OBJC_DISABLE_INITIALIZE_FORK_SAFETY KEYTIMEOUT

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
