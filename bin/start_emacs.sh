#!/bin/bash

source "$ENVDIR/functions.lib.sh"

if ! which emacs > /dev/null 2>&1 ; then
    echo "Can't find 'emacs' in PATH. Starting vim instead."
    vim "$@"
    exit
fi

emc=$(deref "$(which emacsclient)") # location of emacsclient
emc="${emc} -c"                      # create new frame
emc="${emc} -n"                      # don't wait for emacs to return

${emc} -a '' "$@"
