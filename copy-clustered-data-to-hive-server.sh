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

docker exec hive-hive-server-1 mkdir -p /tmp/data/

# Copia os arquivos para dentro do container
docker cp data/. hive-hive-server-1:/tmp/data/

for i in "${!tables[@]}"; do
    table="${tables[$i]}"
    tmp_table="${table}_tmp"
    filename="${filenames[$i]}"

    echo "Loading $filename into $tmp_table, then inserting into $table..."

    docker exec -i hive-hive-server-1 bash -c "
        beeline -u jdbc:hive2://localhost:10000 -e \"
            SET hive.strict.checks.bucketing=false;
            SET hive.mapred.mode=nonstrict;
            LOAD DATA LOCAL INPATH '/tmp/data/$filename' INTO TABLE $tmp_table;
            INSERT INTO TABLE $table SELECT * FROM $tmp_table;
        \"
    "
done
