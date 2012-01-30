typeset -U path
path=($HOME/.dotfiles/bin /usr/local/bin $HOME/local/node/bin $path)
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/mysql-5.5.19-osx10.6-x86_64/bin/:$PATH"
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
