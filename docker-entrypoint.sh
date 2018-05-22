#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/parallel-lint "$@"
elif [ "$1" = "/vendor/bin/parallel-lint" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "parallel-lint" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
fi

exec "$@"
