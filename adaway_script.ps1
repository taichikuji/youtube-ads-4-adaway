$links = @("https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list","https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt","https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt")

foreach ($link in $links) {
    $list = Join-Path $PSScriptRoot ($links.IndexOf($link) + ".lists")
    (New-Object System.Net.WebClient).DownloadFile($link, $list)

    if (Test-Path -Path $list) {
        Get-Content $list | ForEach-Object { "0.0.0.0 $_" }
        Remove-Item -Path $list -Force
    }
}

Get-Content "$PSScriptRoot\*.lists" | Sort-Object -Unique | Set-Content (Join-Path $PSScriptRoot "hosts")

Remove-Item -Path "$PSScriptRoot\*.lists" -Force
