$link = "https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list"
$list = "$PSScriptRoot\black.list"
(New-Object System.Net.WebClient).DownloadFile($link, $list)
$record_time = Get-Date

$b = get-content $list
function append-text { 
    process{
     foreach-object {"0.0.0.0 " + $_}
      } 
    }

$b | append-text | out-file ".\hosts"
Remove-Item -Path $list -Force
Write-output "Time taken to make your list available for Adaway: $((Get-Date).Subtract($record_time).Seconds) seconds(s)"