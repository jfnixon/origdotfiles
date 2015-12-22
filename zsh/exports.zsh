# Currently this path is appended to dynamically when picking a ruby version
# /etc/zshenv has already started PATH with the contents of /etc/paths
typeset -U path      # unique elements only
path=(/usr/local/sbin "$path[@]")
export PATH=$PATH

# init rbenv -- I can't figure out a better place to put this.

eval "$(rbenv init -)"

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# zsh has a new online help facility
export HELPDIR=/usr/local/share/zsh/help

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='mvim -f'

# nvm node version manager
export NVM_DIR=~/.nvm
source "$(brew --prefix nvm)/nvm.sh"

#export NODE_PATH=/opt/github/homebrew/lib/node_modules
#export PYTHONPATH=/usr/local/lib/python2.6/site-packages
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C 

# rbenv stuff
export RBENV_ROOT="$HOME/.rbenv"

#export GH_ISSUE_CREATE_TOKEN=083f60c674d8eb41f98258df9fc8d94cb733218a

# Virtual Environment Stuff
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects/django
# source /usr/local/bin/virtualenvwrapper.sh
