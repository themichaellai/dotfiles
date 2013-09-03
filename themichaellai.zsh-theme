PROMPT='%{$fg_bold[red]%}%m%{$reset_color%}%{$reset_color%}%# '
RPROMPT='%{$fg[cyan]%}%c%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}% '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}:%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%}%{$fg[yellow]%}✗%{$fg[green]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"
