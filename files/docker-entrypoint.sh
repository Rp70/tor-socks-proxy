#!/bin/sh

set -e
if [ "$STARTUP_DEBUG" = 'yes' ]; then
    set -x
fi

CMD=$1
if [ "$CMD" != 'startup' ]; then
    exec "$@"
    exit $?
fi

# Set defaults if noone specified.
TOR_PROCESSES=${TOR_PROCESSES:=10}
TOR_PORT_PREFIX=${TOR_PORT_PREFIX:=90}
export TOR_PROCESSES TOR_PORT_PREFIX

exec supervisord --nodaemon;
