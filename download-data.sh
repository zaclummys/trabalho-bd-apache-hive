#!/bin/bash

set -x
cd "$(dirname "$0")"

# use two lists: list of URLs and filenames to download the data files

urls=(
    "https://osf.io/download/gpmvy/"
    "https://osf.io/download/bxt6n/"
    "https://osf.io/download/vrmy5/"
    "https://osf.io/download/67dqy/"
    "https://osf.io/download/5hrc6/"
    "https://osf.io/download/u7jgq/"
)

filenames=(
    "crime.csv"
    "district.csv"
    "neighborhood.csv"
    "segment.csv"
    "time.csv"
    "vertice.csv"
)

# check if the data directory exists, if not create it
mkdir -p ./data

# check if the files already exist, if not download them
for i in "${!urls[@]}"; do
    url="${urls[$i]}"
    filename="${filenames[$i]}"
    
    # check if the file already exists
    if [ ! -f "./data/$filename" ]; then
        wget "$url" -O "./data/$filename"
    else
        echo "$filename already exists, skipping download."
    fi
done