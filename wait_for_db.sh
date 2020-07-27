#!/bin/sh
set -e
  
cmd="$@"
  
until PGPASSWORD=$POSTGRES_PASSWORD psql -h "db" -U "postgres" -c '\q'  > /dev/null 2>&1; do
  >&2 echo "Waiting for database"
  sleep 3
done
  
>&2 echo "Postgres is up - executing command"
exec $cmd
