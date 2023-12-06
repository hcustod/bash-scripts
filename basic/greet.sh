#!/bin/bash

name="$1"   #first command line argument

if [ -z  "$name" ]; then
    echo "Usage: $0 <name>"
else
    echo "Hello, $name!"
fi 

