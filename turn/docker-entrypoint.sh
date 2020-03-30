#!/bin/sh

# ENV realm
if [ -n "$REALM" ]; then
    sed -i "s/^realm=example.org/realm=$REALM/" /etc/coturn/turnserver.conf
fi

# If command starts with an option, prepend with turnserver binary.
if [ "${1:0:1}" == '-' ]; then
  set -- turnserver "$@"
fi

exec $(eval "echo $@")
