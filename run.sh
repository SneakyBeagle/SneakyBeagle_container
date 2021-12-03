#!/bin/bash

echo "Starting..."
echo -n "Enter a password to use for the container: "
read -s password
echo ""

echo -n "Enter the Nessus license key: "
read -s LICENSE
echo ""

docker-compose build --build-arg password="$password" --build-arg LICENSE="$LICENSE" --no-cache

docker-compose up
