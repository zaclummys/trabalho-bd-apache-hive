#!/bin/bash

set -x
cd "$(dirname "$0")"

docker cp schema/. hive-hive-server-1:/tmp/schema/

docker exec hive-hive-server-1 beeline -u jdbc:hive2://localhost:10000 -f /tmp/schema/create-tables.sql