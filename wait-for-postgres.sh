#!/bin/sh
set -e

host="$1"
shift
cmd="$@"

connection_is_ready () {
    pg_isready --dbname=$DATABASE_URL;
}

until connection_is_ready; do
    if [ $? -ne 0 ]; then
        sleep 1
    fi
done

>&2 echo "Postgres is up - executing command"
exec $cmd
