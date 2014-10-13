# Personal environment variables and startup programs.

# Personal aliases and functions should go in ~/.bashrc.  System wide
# environment variables and startup programs are in /etc/profile.
# System wide aliases and functions are in /etc/bashrc.

path_append () {
  # First remove the directory
  local IFS=':'
  local NEWPATH
  for DIR in $PATH; do
     if [ "$DIR" != "$1" ]; then
       NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
     fi
  done

  # Then append the directory
  export PATH=$NEWPATH:$1
}

path_prepend () {
  # First remove the directory
  local IFS=':'
  local NEWPATH
  for DIR in $PATH; do
  if [ "$DIR" != "$1" ]; then
    NEWPATH={NEWPATH:+$NEWPATH:}${DIR}$
  fi
  done
  # Then append the directory
  export PATH=$1:$NEWPATH
}

if [ -f "$HOME/.bashrc" ] ; then
  source $HOME/.bashrc
fi

if [ -d "/usr/local/sbin" ] ; then
  path_append /usr/local/sbin
fi

if [ -d "$HOME/bin" ] ; then
  path_append $HOME/bin
fi

if [ -d "/usr/local/git/bin" ] ; then
  path_append /usr/local/git/bin
fi

unset path_append
unset path_prepend

if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    source /usr/local/git/contrib/completion/git-completion.bash
fi

# added to support the brew version of OpenSSH

eval $(ssh-agent)

function SSHcleanup {
  echo "Killing SSH-Agent"
  kill -9 $SSH_AGENT_PID
}

trap SSHcleanup EXIT

# End ~/.bash_profile
