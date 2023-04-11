#!/bin/bash

source "$DENV/functions.lib.sh"
ME=$(basename $0)

if ! which emacsclient > /dev/null 2>&1 ; then
    echo "Can't find 'emacsclient' in PATH. Starting vim instead."
    vim "$@"
    exit
fi

client=$(deref "$(which emacsclient)")      # location of emacsclient

# run in terminal if called as emt
if [[ $ME == "emt" ]] ; then
  $client -a '' -t "$@"
  exit 0
fi

# create new frame if run as emc
if [[ $ME == "emc" ]] ; then
  client="${client} -c"
fi


# don't wait for emacs to return
client="${client} -n"

# -a with empty string to auto-start emacs daemon
${client} -a '' "$@"
