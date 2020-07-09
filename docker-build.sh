#!/usr/bin/env sh
if [ "${EUID}" -ne "0" ]; then
   echo -e "You must be root to proceed.\n" \
           "If you do want to experience with user namespaces, extend this script manually." 1>&2
   exit 1
fi

docker build --tag docker-unturned:steamcmd ${PWD}/steamcmd 

docker build --tag docker-unturned:latest ${PWD}

