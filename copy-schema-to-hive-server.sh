#!/bin/bash

set -x
cd "$(dirname "$0")"

docker cp schema/. hive:/tmp/schema/

docker exec hive beeline -u jdbc:hive2://localhost:10000 -f /tmp/schema/create-tables.sql