$links = @("https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt", "https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt", "https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt")

function Append-Text {
    process {
        foreach-object { "0.0.0.0 $_" }
    }
}

$hosts = @()

ForEach ($link in $links) {
    $content = (New-Object System.Net.WebClient).DownloadString($link)
    $processedContent = $content.Split([Environment]::NewLine) | Append-Text
    $hosts += $processedContent
}

$hosts | Sort-Object -Unique | Set-Content (Join-Path $PSScriptRoot "hosts")
