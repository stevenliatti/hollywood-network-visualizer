#!/usr/bin/env bash

echo "With ~/reqs/actors-reqs$1.txt"

for req in $(cat ~/reqs/actors-reqs$1.txt)
do
    echo "curl to localhost:3000$req"
    curl -s "localhost:3000$req" > /dev/null
done
