#!/bin/bash
links=("https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list" "https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt")
for link in "${links[@]}"
do
    curl $link --output black.list
    sed 's/^/0.0.0.0 /' black.list >> list
    rm black.list
done

sort list | uniq > hosts
rm list
