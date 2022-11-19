#!/bin/bash

source "$DENV/functions.lib.sh"
ME=$(basename $0)

if ! which emacsclient > /dev/null 2>&1 ; then
    echo "Can't find 'emacsclient' in PATH. Starting vim instead."
    vim "$@"
    exit
fi

client=$(deref "$(which emacsclient)")      # location of emacsclient
[[ $ME == "emc" ]] && client="${client} -c" # create new frame
client="${client} -n"                       # don't wait for emacs to return

# -a with empty string to auto-start emacs daemon
${client} -a '' "$@"
