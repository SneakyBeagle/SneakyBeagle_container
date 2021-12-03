#!/bin/bash

echo "Starting..."
echo -n "Enter a password to use for the container: "
read -s password
echo ""

docker-compose build --build-arg password="$password" --no-cache

docker-compose up -d
