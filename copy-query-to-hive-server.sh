#!/bin/bash

set -x
cd "$(dirname "$0")"

# Ensure a query name was passed
if [ -z "$1" ]; then
  echo "Usage: $0 <query_name_without_sql_extension>"
  exit 1
fi

# Proper variable assignment (no `$` on the left-hand side)
query="$1.sql"

docker exec hive-hive-server-1 mkdir -p /tmp/queries
docker cp "queries/$query" hive-hive-server-1:/tmp/queries/$query
docker exec hive-hive-server-1 bash -c "beeline -u jdbc:hive2://localhost:10000 -f /tmp/queries/$query"
