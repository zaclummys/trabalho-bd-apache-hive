#!/bin/bash

set -x
cd "$(dirname "$0")"

docker cp data/crime.csv hive-hive-server-1:/tmp/
docker cp data/segment.csv hive-hive-server-1:/tmp/
docker cp data/vertice.csv hive-hive-server-1:/tmp/
docker cp data/time.csv hive-hive-server-1:/tmp/
docker cp data/district.csv hive-hive-server-1:/tmp/
docker cp data/neighborhood.csv hive-hive-server-1:/tmp/