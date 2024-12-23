$uri = "https://patchdb.manageengine.com/crs/dmz/UpdateManager.zip"
$outfile = "$($env:TEMP)/UpdateManager.zip"
$folder = "$($env:TEMP)/UpdateManager"
if (-not (Test-Path $outfile)){Invoke-WebRequest -Uri $uri -OutFile $outfile}
if (-not (Test-Path $folder)){Expand-Archive $outfile -DestinationPath $folder}
$PathParent = $PWD.Path
Set-Location $folder
."$($folder)\patchsync.bat" -c updatedb -b 11.3.2440.01
Set-Location $PathParent
