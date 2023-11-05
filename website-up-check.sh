#!/bin/bash

check_website() {
    local website="$1"
    if curl --head --silent --fail "$website" 2>/dev/null; then
        echo "Website $website is online."
    else
        echo "Website $website is offline or unreachable"
    fi
}

read -p "Enter a website URL to check: " website_url

check_website "$websiteurl"

