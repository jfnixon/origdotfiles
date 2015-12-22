# -------------------------------------------------------------------
# any function from http://onethingwell.org/post/14669173541/any
# search for running processes
# -------------------------------------------------------------------
#any() {
#    emulate -L zsh
#    unsetopt KSH_ARRAYS
#    if [[ -z "$1" ]] ; then
#        echo "any - grep for process(es) by keyword" >&2
#        echo "Usage: any " >&2 ; return 1
#    else
#        ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
#    fi
#}

# -------------------------------------------------------------------
# display a neatly formatted path
# -------------------------------------------------------------------
ppath() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}

# -------------------------------------------------------------------
# Mac specific functions
# -------------------------------------------------------------------
#if [[ $IS_MAC -eq 1 ]]; then
#
#    # view man pages in Preview
#    pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }
#
#fi

# -------------------------------------------------------------------
# nice mount (http://catonmat.net/blog/another-ten-one-liners-from-commandlingfu-explained)
# displays mounted drive information in a nicely formatted manner
# -------------------------------------------------------------------
function nicemount() { (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1') | column -t ; }

# -------------------------------------------------------------------
# myIP address
# -------------------------------------------------------------------
function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# -------------------------------------------------------------------
# console function
# -------------------------------------------------------------------
#function console () {
#  if [[ $# > 0 ]]; then
#    query=$(echo "$*"|tr -s ' ' '|')
#    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
#  else
#    tail -f /var/log/system.log
#  fi
#}

# -------------------------------------------------------------------
# shell function to define words
# http://vikros.tumblr.com/post/23750050330/cute-little-function-time
# -------------------------------------------------------------------
#givedef() {
#  if [[ $# -ge 2 ]] then
#    echo "givedef: too many arguments" >&2
#    return 1
#  else
#    curl "dict://dict.org/d:$1"
#  fi
#}

function ff() { find . -type f -iname '*'$*'*' -ls ; }

# Open argument in Dash
function dash() { open "dash://$*" }

function dman() { open "dash://man:$*" }

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

