# this is the url for guideline https://www.manageengine.com/products/desktop-central/help/configuring_desktop_central/patch_management_for_closed_network.html

$uri = "https://patchdb.manageengine.com/crs/dmz/UpdateManager.zip"
$outfile = "$($env:TEMP)/UpdateManager.zip"
$folder = "$($env:TEMP)/UpdateManager"
$date = (Get-Date).ToString("yyyy_MM_dd_hh_mm_ss")
if (-not (Test-Path $outfile)){Invoke-WebRequest -Uri $uri -OutFile $outfile}
if (-not (Test-Path $folder)){Expand-Archive $outfile -DestinationPath $folder}
$PathParent = $PWD.Path
write-output "location is $($PathParent)"
Set-Location $folder
."$($folder)\patchsync.bat" -c updatedb -b 11.3.2440.09
dir
Compress-Archive -Path updatedb -DestinationPath "updatedb_$($date).zip"
dir
Copy-Item "updatedb_$($date).zip" $PathParent
write-output "location is $($PathParent)"
