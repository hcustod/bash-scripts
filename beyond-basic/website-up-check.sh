#!/bin/bash

check_website() {
    local website="$1"
    if ping -c 1 "$website"; then
        echo "Website $website is online."
    else
        echo "Website $website is offline or unreachable"
    fi
}

read -p "Enter a website URL to check: " website_url

website_url=$(echo "$website_url" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

if [ -z "$website_url" ]; then
    echo "Invalid input. Please enter a valid website URL."
    exit 1
fi

check_website "$websiteurl" 

