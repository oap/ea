# Wrong system time
# Another option is to change the timezone 
# Set system time 10 minutes back 
# Set-Date -Adjust -0:10:0 -DisplayHint Time 

$localTime =  [int][double]::Parse((Get-Date (Get-Date).toUniversalTime() -UFormat %s))
$netTime = (ConvertFrom-Json -InputObject (Invoke-WebRequest -Uri https://worldtimeapi.org/api/timezone/etc/UTC).Content).unixtime

$diff = [Math]::Abs($localTime - $netTime)

# Write-Host "Local time: $localTime"
# write-host "Network time: $netTime"

if ($diff -gt 60){
    Write-Host "Local time is different than network time by more than a minute"
} else {
    Write-Host "Local time is the same as network time"
}
