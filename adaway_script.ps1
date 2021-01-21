$links = @("https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list", "https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt")
function append-text { 
    process{
        foreach-object {"0.0.0.0 " + $_}
     }
    }

$time = Get-Date
ForEach ($link in $links){
    $list = "$PSScriptRoot\" + $links.IndexOf($link) + ".lists"
    (New-Object System.Net.WebClient).DownloadFile($link, $list)
    If (Test-Path -Path $list) {
	    Get-content $list | append-text | Add-Content -Path "$PSScriptRoot\list"
    }
    Remove-Item -Path $list -Force
}
Get-content "$PSScriptRoot\list" | Sort-Object -Unique | Set-Content "$PSScriptRoot\hosts"
Remove-Item -Path "$PSScriptRoot\list" -Force
Write-output "Time taken to make your list available for Adaway: $((Get-Date).Subtract($time).Seconds) seconds(s)"