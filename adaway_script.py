#!/bin/python3
import urllib.request
import os

links = ["https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt","https://raw.githubusercontent.com/manhd89/YouTube-Ads/refs/heads/main/youtube_ad_urls.txt"]

hosts = set()

for link in links:
    with urllib.request.urlopen(link) as response:
        content = response.read().decode('utf-8')
        for line in content.splitlines():
            line = line.strip()
            if line:
                hosts.add(f"0.0.0.0 {line}")

with open(os.path.join(os.path.dirname(__file__), "hosts"), "w") as f:
    for host in sorted(hosts):
        f.write(f"{host}\n")
