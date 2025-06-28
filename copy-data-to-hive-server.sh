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

docker cp data/. hive:/tmp/data/

for i in "${!tables[@]}"; do
    table="${tables[$i]}"
    filename="${filenames[$i]}"
    query="LOAD DATA LOCAL INPATH \"/tmp/data/$filename\" INTO TABLE \`$table\`;"
    echo "Executing query: $query"
    docker exec -it hive bash -c "beeline -u jdbc:hive2://localhost:10000 -e '$query'"
done
