#!/bin/bash

set -x
cd "$(dirname "$0")"

data=(
    "crime"
    "segment"
    "vertice"
    "time"
    "district"
    "neighborhood"
)

for file in "${data[@]}"; do
    docker cp data/$file.csv hive-hive-server-1:/tmp/
done

for table in "${data[@]}"; do
    docker exec -it hive-hive-server-1 bash -c "beeline -u jdbc:hive2://localhost:10000 -e \"LOAD DATA LOCAL INPATH '/tmp/$table.csv' INTO TABLE $table;\""
done

for table in "${data[@]}"; do
    docker exec -it hive-hive-server-1 bash -c "beeline -u jdbc:hive2://localhost:10000 -e \"SELECT COUNT(*) as $table FROM $table;\""
done