# Youtube-ads-4-adaway

## Automatic repository using Github Actions that updates and creates a usable hosts file for Adaway and other similar applications.

### Getting started

In order to use these modified hosts files, there are multiple ways to do so. As indicated in the title of the project, this is meant to be used mainly on Adaway, hence, in order to have it integrated within the app, you have to add the following link:

```https://raw.githubusercontent.com/taichikuji/youTube-ads-4-adaway/master/hosts```


### Running the scripts

There are two scripts, one for Windows, and another one for linux. ( ps1 for Windows, sh for Linux)

# How does the script work

1. It downloads the list to whatever folder you have the script in
2. It will apply the changes that it requires to work on adaway
3. After downloading, it removes the original list file and just leaves the modified version

_This script should always work as long as the main repository is still up and running._
