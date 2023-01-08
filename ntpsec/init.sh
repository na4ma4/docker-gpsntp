#!/bin/bash

mkdir /etc/ntpsec/acl.d/

if [[ ! -z ${ALLOW_QUERY_RANGE} ]]; then
    echo "restrict ${ALLOW_QUERY_RANGE} kod nomodify nopeer limited" | tee /etc/ntpsec/acl.d/00-allow.conf > /dev/null
fi

exec "$@"
