#!/bin/sh
set -e

connection="$1"

connection_is_ready () {
    pg_isready --dbname=$connection;
}

until connection_is_ready; do
    if [ $? -ne 0 ]; then
        sleep 1
    fi
done

echo "Postgres is up"
