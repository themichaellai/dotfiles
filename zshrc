# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="themichaellai"
ZSH_THEME="pure"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
alias git='/usr/local/bin/git'
alias gbst='git for-each-ref --sort=-committerdate refs/ --format='"'"'%(objectname:short) %(committerdate:short) %(authorname) %(refname:short)'"'"''
plugins=(git rails gem npm rsync bower grunt zsh-syntax-highlighting tmux vagrant sublime)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/michael/bin
setopt append_history no_inc_append_history no_share_history
HIST_IGNORE_SPACE="true"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/Users/michael/bin:$PATH"

export PATH="/usr/texbin:$PATH"

export PATH="$HOME/opt/android/tools:$HOME/opt/android/platform-tools:$PATH"

export GOPATH="$HOME/bin/go"

#export NVM_DIR=""
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

alias tagcheck='ruby /home/michael/programming/lastfmtagcheck/tag_check.rb'
alias myip="curl -s ip\.nu | egrep --color=no -o '[0-9\.]+'"

alias todo="cat /home/michael/todo"

alias ls="ls -F"

alias clipboard='xclip -sel clip'

alias slack-post='/Users/michael/programming/slack-post/venv/bin/python /Users/michael/programming/slack-post/slack-post.py'


export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/bin/vim

bindkey -v
bindkey '^R' history-incremental-search-backward

function trim_whitespace {
  sed -i 's/[ \t]*$//' $1
}

PURE_GIT_PULL=0

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH=$GEM_HOME/bin:$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
