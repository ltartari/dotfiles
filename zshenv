typeset -U path
path=($HOME/.dotfiles/bin /usr/local/bin $path)
export PATH="$HOME/.rbenv/bin:$PATH"

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
