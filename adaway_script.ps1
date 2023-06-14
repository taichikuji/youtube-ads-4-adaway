$links = @("https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list", "https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt", "https://raw.githubusercontent.com/kliff-k/YtAdList/main/youtube.txt")
function Append-text { 
    process{
        foreach-object {"0.0.0.0 " + $_}
     }
    }

ForEach ($link in $links){
    $list = "$PSScriptRoot\" + $links.IndexOf($link) + ".lists"
    (New-Object System.Net.WebClient).DownloadFile($link, $list)
    If (Test-Path -Path $list) {
	    Get-content $list | Append-text | Add-Content -Path "$PSScriptRoot\list"
    }
    Remove-Item -Path $list -Force
}
Get-content "$PSScriptRoot\list" | Sort-Object -Unique | Set-Content "$PSScriptRoot\hosts"
Remove-Item -Path "$PSScriptRoot\list" -Force
