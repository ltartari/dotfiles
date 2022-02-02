# use ripgrep for FZF
FZF_DEFAULT_COMMAND="rg --files --follow --hidden"

# miscelaneous env vars

HISTCONTROL="ignoreboth"

# enable heroku autocomplete
HEROKU_AC_ZSH_SETUP_PATH=$HOME/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# default browser
CHROME="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
# FIREFOX="/Applications/Firefox.app/Contents/MacOS/firefox"
# use chrome as the env browser
# alternatively, enable and change to FIREFOX
BROWSER="$CHROME"

GPG_TTY=$(tty)
KEYTIMEOUT=1
TERM="screen-256color"

# use neovim as editor
EDITOR="/usr/local/bin/nvim"

# Show therefore icon as prompt symbol
PURE_PROMPT_SYMBOL=∴
