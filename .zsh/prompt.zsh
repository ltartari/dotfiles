#Set prompt style using 'off' theme
autoload -Uz promptinit
promptinit
prompt off

# prompt
# PS1="%{$fg[green]%}%c %{$fg[red]%}%% %{$reset_color%}"
# PS1="%{$fg[red]%} ∴ %{$reset_color%} %{$fg[white]%}%m:%{$reset_color%} $PS1"

PROMPT="╭─ %B%{$fg[green]%}%~%{$reset_color%}%b %{$(git_super_status)%}
╰─ %{$fg[red]%}∴%{$reset_color%} "

RPROMPT="$(battery_status)"
