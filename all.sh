#!/bin/bash

set -x
cd "$(dirname "$0")"

./start-hive-server.sh
./download-data.sh
./copy-schema-to-hive-server.sh
./copy-data-to-hive-server.sh
./copy-queries-to-hive-server.sh