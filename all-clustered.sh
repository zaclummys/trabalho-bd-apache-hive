#!/bin/bash

set -x
cd "$(dirname "$0")"

docker compose -f hive/docker-compose.yml up -d

./download-data.sh
./copy-clustered-schema-to-hive-server.sh
./copy-clustered-data-to-hive-server.sh
./copy-queries-to-hive-server.sh

docker compose -f hive/docker-compose.yml logs hive-server > clustered-hive-server.log