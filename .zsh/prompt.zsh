# set prompt style using 'off' theme
autoload -Uz promptinit
promptinit
prompt off

PROMPT="╭─ %B%{$fg[green]%}%~%{$reset_color%}%b
⎬ $(prompt_git_info)
╰─ %{$fg[red]%}∴%{$reset_color%} "

RPROMPT="$(battery_status)"
