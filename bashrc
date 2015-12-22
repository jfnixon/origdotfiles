#
# various setups for bash
#

export LC_TYPE=en_US.UTF-8
export PAGER=less
export VISUAL='mvim -f'

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

#
# Personal aliases
#

alias du='du -kh'
alias f='open -a Forklift'
alias fi='open -a Finder'
alias ls='ls -F'
alias lsa='ls -a'
alias h='history'
alias l='ls -l'
alias la='ls -al'
alias lm='ls -al | more'
alias lx='ls -lXB'
alias more='less'
alias md='mkdir -p'


#prettyprint some output
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

#
# set options
#

set -o vi

#
# complex functions
#

function ff() { find . -type f -iname '*'$*'*' -ls ; }

# Open argument in Dash
function dash() { open "dash://$*" }

function dman() { open "dash://man:$*" }

# Tail the console, also with grep
#function console () {
#  if [[ $# > 0 ]]; then
#    query=$(echo "$*"|tr -s ' ' '|')
#    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
#  else
#    tail -f /var/log/system.log
#  fi
#}

# machine info
function mach() {
  echo -e "\nMachine information:" ; uname -a
  echo -e "\nUsers logged on:" ; w -h
  echo -e "\nCurrent date :" ; date
  echo -e "\nMachine status :" ; uptime
  echo -e "\nMemory status :" ; mstat.py
  echo -e "\nFilesystem status :"; df -h
}

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { enscript -2qCG -Eruby -f Courier8 -r -p - ${1} | lpr ; }

function ask() {          # See 'killps' for example of use.
  echo -n "$@" '[y/n] ' ; read ans
  case "$ans" in
      y*|Y*) return 0 ;;
      *) return 1 ;;
  esac
}

function __git_dirty {
  git diff --quiet HEAD &>/dev/null 
  [ $? == 1 ] && echo "!"
}

function __git_ps1 {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
      printf " %s" "${b##refs/heads/}";
  fi
}

function __git_branch {
    __git_ps1 " %s"
}

function __rbenv_ps1 () {
    rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
    echo "$rbenv_ruby_version "
}

bash_prompt() {
  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  # background colors
  local BGK="\[\033[40m\]"
  local BGR="\[\033[41m\]"
  local BGG="\[\033[42m\]"
  local BGY="\[\033[43m\]"
  local BGB="\[\033[44m\]"
  local BGM="\[\033[45m\]"
  local BGC="\[\033[46m\]"
  local BGW="\[\033[47m\]"

  local UC=$W                 # user's color
  [ $UID -eq "0" ] && UC=$R   # root's color

  PS1="$B$(__rbenv_ps1)$C\h$K:$EMY\w$EMC\$(__git_branch)$EMR\$(__git_dirty)${NONE} $ "
}

bash_prompt
unset bash_prompt

eval "$(rbenv init -)"
