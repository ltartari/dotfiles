#!/bin/zsh
# to install source this file from your .zshrc file

# allow for functions in the prompt.
setopt PROMPT_SUBST

autoload -U add-zsh-hook

add-zsh-hook chpwd chpwd_update_git_vars
add-zsh-hook preexec preexec_update_git_vars
add-zsh-hook precmd precmd_update_git_vars

## Function definitions
function preexec_update_git_vars() {
    case "$2" in
        git*)
        __EXECUTED_GIT_COMMAND=1
        ;;
    esac
}

function precmd_update_git_vars() {
    if [ -n "$__EXECUTED_GIT_COMMAND" ]; then
        update_current_git_vars
        unset __EXECUTED_GIT_COMMAND
    fi
}

function chpwd_update_git_vars() {
    update_current_git_vars
}

function update_current_git_vars() {
    unset __current_git_status

    local gitstatus="$__GIT_PROMPT_DIR/gitstatus.py"
    _git_status=`python ${gitstatus}`
    __current_git_status=("${(@f)_git_status}")
    git_branch=$__current_git_status[1]
    git_remote=$__current_git_status[2]
    git_staged=$__current_git_status[3]
    git_conflicts=$__current_git_status[4]
    git_changed=$__current_git_status[5]
    git_untracked=$__current_git_status[6]
    git_clean=$__current_git_status[7]
}

git_super_status() {
    if [ -n "$__CURRENT_GIT_STATUS" ]; then
    STATUS="($GIT_BRANCH"
    STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH%{${reset_color}%}"
    if [ -n "$GIT_REMOTE" ]; then
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_REMOTE$GIT_REMOTE%{${reset_color}%}"
    fi
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
    if [ "$GIT_STAGED" -ne "0" ]; then
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED%{${reset_color}%}"
    fi
    if [ "$GIT_CONFLICTS" -ne "0" ]; then
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS%{${reset_color}%}"
    fi
    if [ "$GIT_CHANGED" -ne "0" ]; then
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED%{${reset_color}%}"
    fi
    if [ "$GIT_UNTRACKED" -ne "0" ]; then
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED%{${reset_color}%}"
    fi
    if [ "$GIT_CLEAN" -eq "1" ]; then
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi
    STATUS="$STATUS%{${reset_color}%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
    echo "$STATUS"
    fi
}

# Default values for the appearance of the prompt. Configure at will.
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}✚"
ZSH_THEME_GIT_PROMPT_REMOTE=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"
