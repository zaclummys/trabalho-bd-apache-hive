#!/bin/bash

set -x
cd "$(dirname "$0")"

docker cp queries/. hive-hive-server-1:/tmp/queries/

for query in queries/*.sql; do
    docker exec hive-hive-server-1 beeline -u jdbc:hive2://localhost:10000 -f "/tmp/$query"
done