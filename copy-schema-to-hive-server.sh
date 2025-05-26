#!/bin/bash

set -x
cd "$(dirname "$0")"

docker cp schema/drop-tables.sql hive-hive-server-1:/tmp
docker cp schema/create-tables.sql hive-hive-server-1:/tmp

docker exec hive-hive-server-1 beeline -u jdbc:hive2://localhost:10000 -f /tmp/drop-tables.sql
docker exec hive-hive-server-1 beeline -u jdbc:hive2://localhost:10000 -f /tmp/create-tables.sql