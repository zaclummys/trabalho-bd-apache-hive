#!/bin/bash

set -x
cd "$(dirname "$0")"

docker compose -f hive/docker-compose.yml up -d

./download-data.sh
./copy-schema-to-hive-server.sh
./copy-data-to-hive-server.sh
./copy-queries-to-hive-server.sh

docker compose -f hive/docker-compose.yml logs hive-server > hive-server.log