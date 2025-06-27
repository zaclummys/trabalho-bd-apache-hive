#!/bin/bash

set -x
cd "$(dirname "$0")"

queries=(
    "1.sql"
    "2.sql"
    "3.sql"
    "4.sql"
    "5.sql"
    "6.sql"
    "7.sql"
)

for query in "${queries[@]}"; do
    docker cp "queries/$query" hive-hive-server-1:/tmp/queries/
done

for query in "${queries[@]}"; do
    docker exec hive-hive-server-1 bash -c "beeline -u jdbc:hive2://localhost:10000 -f /tmp/queries/$query"
done