#!/bin/bash

set -x
cd "$(dirname "$0")"

tables=(
    "crime"
    "segment"
    "vertice"
    "time"
    "district"
    "neighborhood"
)

filenames=(
    "crime.csv"
    "segment.csv"
    "vertice.csv"
    "time.csv"
    "district.csv"
    "neighborhood.csv"
)

docker cp data/. hive-hive-server-1:/tmp/data/

for i in "${!tables[@]}"; do
    table="${tables[$i]}"
    filename="${filenames[$i]}"

    docker exec -it hive-hive-server-1 bash -c "beeline -u jdbc:hive2://localhost:10000 -e \"LOAD DATA LOCAL INPATH '/tmp/$filename' INTO TABLE $table;\""
done

for table in "${table[@]}"; do
    docker exec -it hive-hive-server-1 bash -c "beeline -u jdbc:hive2://localhost:10000 -e \"SELECT COUNT(*) as $table FROM $table;\""
done