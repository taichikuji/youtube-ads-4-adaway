#!/bin/sh

link="https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list"
online_md5="$(curl -sL $link | md5sum | cut -d ' ' -f 1)"
local_md5="$(md5sum hosts | cut -d ' ' -f 1)"

if [ ! "$online_md5" == "$local_md5" ]; then
    curl $link --output black.list
    sed 's/^/0.0.0.0 /' black.list > hosts
    rm black.list
fi
