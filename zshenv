typeset -U path

path=($HOME/.dotfiles/bin /usr/local/bin $path)

export PATH="/usr/local/bin:/usr/local/sbin:/Users/leonardotartari/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
