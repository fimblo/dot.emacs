#!/bin/bash
# Simplified Emacs starter script.
#
# Use: Create symlinks to this script in your PATH to launch
# emacsclient in different modes:
#
# 1. Terminal mode:  ln -s /path/to/script emt
# 2. New window mode: ln -s /path/to/script emc
# 3. Existing window mode: ln -s /path/to/script em
#
# emt and emc initiates an emacs server if not already running and
# opens files accordingly. em assumes a server is running.

ME=$(basename "$0")

if ! which emacsclient > /dev/null 2>&1 ; then
  echo "Can't find 'emacsclient' in PATH. Starting vim instead."
  vim "$@"
  exit
fi

client=$(realpath "$(which emacsclient)")

if [[ $ME == "emt" ]] ; then
  # run in terminal if called as emt
  $client -a '' -t "$@"
  exit 0

elif [[ $ME == "emc" ]] ; then 
  # create new frame if run as emc
  client="${client} -c"

else 
  # any other name opens emacs in an existing window
  true
fi


# don't wait for emacs to return
client="${client} -n"

# -a with empty string to auto-start emacs daemon
export TERM=xterm
${client} -a '' "$@"
