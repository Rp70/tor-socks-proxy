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
TOR_PROCESSES_START=${TOR_PROCESSES_START:=1}
TOR_PORT_PREFIX=${TOR_PORT_PREFIX:=90}
TOR_LISTEN_IP=${TOR_LISTEN_IP:='0.0.0.0'}
export TOR_PROCESSES TOR_PROCESSES_START TOR_PORT_PREFIX TOR_LISTEN_IP

exec supervisord --nodaemon;
