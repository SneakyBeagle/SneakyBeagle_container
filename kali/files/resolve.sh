#!/bin/bash

# Resolve a list of hostnames
# Example usage: ./resolve.sh hostnames.txt
# Example of hostnames.txt: host1.local host2.local host3.local

f=$1

hosts=$(cat $f)

for h in $hosts; do
    echo $h $(getent hosts $h | awk '{ print $1 }')
done
