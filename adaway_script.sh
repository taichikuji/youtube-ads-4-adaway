#!/bin/bash
links=("https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list" "https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt" "https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt")
for link in "${links[@]}"
do
    curl --silent --output black.list $link
    sed 's/^/0.0.0.0 /' black.list >> list
    rm black.list
done

sort list | uniq > hosts
rm list