PROMPT=$'╭─ %B%{$fg[green]%}%~%{$reset_color%}%b
⎬➞$(prompt_git_info) %{$reset_color%}
╰─ %{$fg[red]%}∴%{$reset_color%} '

# PROMPT=$'%{${fg[cyan]}%}%B%~%b$(prompt_git_info)%{${fg[default]}%} '

RPROMPT="$(battery_status)"
