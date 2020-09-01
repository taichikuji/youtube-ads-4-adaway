# Youtube-ads-4-adaway

## Automatic repository using Github Actions that updates and creates a usable hosts file for Adaway and other similar applications.

## Before starting, you have two ways of doing this;

- Download / follow the list directly from this repo and install it on your Adaway app

```wget https://raw.githubusercontent.com/taichikuji/youTube-ads-4-adaway/master/hosts```


- The second option is to use the script to transform the list locally, and then implement it however you want

```https://raw.githubusercontent.com/taichikuji/youTube-ads-4-adaway/master/adaway_script.ps1```

# How the script works

1. It downloads the list to whatever folder you have the script in
2. It will apply the changes that it requires to work on adaway
3. After downloading, it removes the original list file and just leaves the modified version

### This script should always work as long as the main repository is still up and running.
