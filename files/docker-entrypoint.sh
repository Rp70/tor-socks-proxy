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


TOR_PROCESSES=${TOR_PROCESSES:=10}
TOR_PORT_PREFIX=${TOR_PORT_PREFIX:=90}
export TOR_PROCESSES
for i in $(seq 1 $TOR_PROCESSES); do
    mkdir -p /var/lib/tor/tor$i
done


exec supervisord --nodaemon;
