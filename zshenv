typeset -U path

export PATH="/usr/local/bin:/usr/local/sbin:/$HOME/.bin:/$HOME/.zsh/functions:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Load local environment configuration
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

