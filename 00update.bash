#!/usr/bin/env bash

cmd_run() {
    ${TERM} -e '/usr/bin/python updateHostsFile.py -a --replace --flush-dns-cache'
}

for TERM in konsole gnome-terminal lxterminal mate-terminal; do
    if [ -f /usr/bin/${TERM} ] ; then cmd_run ; fi
done
