#!/bin/bash

API_KEY=$NASA_API_KEY
NASA_API_URL="https://api.nasa.gov/planetary/apod?api_key=$API_KEY"

image_url=$(curl -s $NASA_API_URL | grep -o '(?<="hdurl":")[^"]*')

curl -s -o ~/Desktop/apod.jpg $image_url

osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/hcustodio/Desktop/apod.jpg"'
