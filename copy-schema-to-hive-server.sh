#!/bin/bash

set -x
cd "$(dirname "$0")"

sqls=(
    "drop-tables.sql"
    "create-tables.sql"
)

for sql in "${sqls[@]}"; do
    docker exec hive-hive-server-1 mkdir -p /tmp/schema
    docker cp "schema/$sql" hive-hive-server-1:/tmp/schema/
done

# Execute SQL files
for sql in "${sqls[@]}"; do
    docker exec hive-hive-server-1 beeline -u jdbc:hive2://localhost:10000 -f "/tmp/schema/$sql"
done
