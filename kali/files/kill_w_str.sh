#!/bin/bash

str=$1

echo "Killing $str"
kill -9 $(ps aux | grep $str | awk '{print $2}')
