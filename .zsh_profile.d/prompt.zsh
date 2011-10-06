#Set prompt style using 'off' theme
autoload -Uz promptinit
promptinit
prompt off

# Change this to reflect your installation directory
export __GIT_PROMPT_DIR=~/.zsh_profile.d/git-prompt/

source ~/.zsh_profile.d/git-prompt/zsh.sh

# prompt
# PS1="%{$fg[green]%}%c %{$fg[red]%}%% %{$reset_color%}"
# PS1="%{$fg[red]%} ∴ %{$reset_color%} %{$fg[white]%}%m:%{$reset_color%} $PS1"

PROMPT='╭─ %~%b$(git_super_status) %# 
╰─ ➜ ' # default prompt

RPROMPT='[%t, %w]'
