#!/bin/bash
links=("https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt" "https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt" "https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt")

hosts="hosts"

for link in "${links[@]}"; do
    curl --silent $link | sed 's/^/0.0.0.0 /' >> $hosts
done

sort -u $hosts -o $hosts
