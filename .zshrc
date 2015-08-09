# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dieter"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Need to do this before loading virtualenv plugin
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
# source /usr/local/bin/virtualenvwrapper.sh
export PATH=/Library/Frameworks/Python.framework/Versions/3.4/bin:$PATH
source /Library/Frameworks/Python.framework/Versions/3.4/bin/virtualenvwrapper.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colorize osx git git-flow-avh pip python rsync systemd virtualenvwrapper virtualenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export EDITOR="vim"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:$PATH
