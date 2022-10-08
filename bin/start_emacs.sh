#!/bin/bash

source "$ENVDIR/functions.lib.sh"

if ! which -s emacs ; then
    echo "Can't find 'emacs' in PATH. Starting vim instead."

    vimterm='xterm -e'
    ! which -s xterm && vimterm=''

    probablyWindowManager="${DISPLAY}${ITERM_PROFILE}"
    if [[ -n $probablyWindowManager ]] ; then
      $vimterm vi "$@" &
    else
      vi "$@"
    fi

    exit
fi

emc=$(deref "$(which emacsclient)") # location of emacsclient
emc="${emc} -c"                      # create new frame
emc="${emc} -n"                      # don't wait for emacs to return
emc="${emc} -a ''"                   # set alternate to empty string to start a daemon

${emc} "$@"
