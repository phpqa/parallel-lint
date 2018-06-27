#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/parallel-lint "$@"
elif [ "$1" = "/composer/vendor/bin/parallel-lint" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "parallel-lint" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
fi

exec "$@"
