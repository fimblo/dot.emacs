#!/bin/bash

# --------------------------------------------------
# Add this to .bashrc or whereever
# --------------------------------------------------

# emacs () 
# { 
#   d=$HOME/.emacs.d/bin
#     if [ $DISPLAY ] && [ -e $d/start_emacs.sh ] ; then
#       $d/start_emacs.sh $@
#     elif [ -e $d/start_emacs_tty.sh ] ; then
#       $d/start_emacs_tty.sh
#     else
#         $(which emacs) $@;
#     fi
# }


# dereference symlinks
deref () {
    arg=$1
    if [ -h "$arg" ] ; then
	l=$(readlink $arg)
	if $(echo $l | grep -q ^/) ; then
	    echo $(deref $l)
	else
	    p=$(dirname $arg)
	    echo $(deref $p/$l)
	fi
    else
	echo $arg
    fi
}

if ! which emacs > /dev/null 2>&1 ; then
    echo "I dont think you've installed emacs. Starting vim instead"
    if [ $DISPLAY ] ; then
        xterm -e vim $@ &
        echo "Emacs was not installed. I ran vim instead."
    else
      echo "Emacs is not installed."
    fi
    exit
fi

emacsbin=$(deref $(which emacs))
emacsclientbin=$(deref $(which emacsclient))

myVersion="GNU Emacs 25"
if ! $emacsbin --version | grep -q "$myVersion" ; then
    echo "This is not version '$myVersion'. Starting whatever version and not starting server."
    $emacsbin $@ &
    exit 0 
fi


# Start emacs daemon if it hasnt already been started.
! ps -ef |grep [eE]macs.*--daemon > /dev/null 2>&1 && \
  $emacsbin --daemon


# If this script was called by name containing string "wait" then we
# wait till user hits 'c-x 5 0' before exiting.
nowait=" -n "
[[ "$(basename $0)" =~ "wait" ]] && unset nowait

# If this script was called by name containing string 'tty' then start
# emacs in the current tty. Otherwise, start in new X window.
displaymode=" -c "
[[ "$(basename $0)" =~ "tty" ]] && displaymode=' -t ' && unset nowait

$emacsclientbin $nowait $displaymode $@


