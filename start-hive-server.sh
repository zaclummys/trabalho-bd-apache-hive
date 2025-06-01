#!/bin/bash

set -x
cd "$(dirname "$0")"

docker-compose -f ./hive/docker-compose.yml up --detach 