#!/bin/python3
import urllib.request
import os

links = ["https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list", "https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt", "https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-YouTube-AdBlock.txt"]

hosts = set()

for link in links:
    with urllib.request.urlopen(link) as response:
        content = response.read().decode('utf-8')
        for line in content.splitlines():
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            
            parts = line.split()
            if parts[0] in ("0.0.0.0", "127.0.0.1", "::1"):
                if len(parts) < 2:
                    continue
                host = parts[1]
            else:
                host = parts[0]

            hosts.add(f"0.0.0.0 {host.lower()}")

with open(os.path.join(os.path.dirname(__file__), "hosts"), "w") as f:
    for host in sorted(hosts):
        f.write(f"{host}\n")
