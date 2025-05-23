#!/bin/bash
links=("https://raw.githubusercontent.com/manhd89/YouTube-Ads/refs/heads/main/youtube_ad_urls.txt" "https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt")

hosts="hosts"

for link in "${links[@]}"; do
    curl --silent $link | sed 's/^/0.0.0.0 /' >> $hosts
done

sort -u $hosts -o $hosts
