#!/bin/bash
links=("https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list" "https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt")

hosts="hosts"

for link in "${links[@]}"; do
    curl --silent $link | sed 's/^/0.0.0.0 /' >> $hosts
done

sort -u $hosts -o $hosts
