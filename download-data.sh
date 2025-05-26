#!/bin/bash

set -x
cd "$(dirname "$0")"

wget https://osf.io/download/gpmvy/ -O ./data/crime.csv
wget https://osf.io/download/bxt6n/ -O ./data/district.csv
wget https://osf.io/download/vrmy5/ -O ./data/neighborhood.csv
wget https://osf.io/download/67dqy/ -O ./data/segment.csv
wget https://osf.io/download/5hrc6/ -O ./data/time.csv
wget https://osf.io/download/u7jgq/ -O ./data/vertice.csv