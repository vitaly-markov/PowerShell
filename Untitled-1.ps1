#1
get-help get-help
#2
get-help get-help -detailed
get-help Get-Help -examples
#3
#4
Get-Command  -Name Set
#5
Get-Command *Item*
#6
Get-Command *Object*
#7
Get-Alias
#8
set-alias gh get-help
#9
Get-process|get-member
#11
Get-Process
Get-Process taskmgr
#12
Get-Service | Where-Object {$_.Status -EQ "Running"}
get-service wuauserv
#13
Get-WmiObject -Class win32_quickfixengineering
#14
(Get-WmiObject Win32_OperatingSystem).OSLanguage
#15
Get-date
#16
get-random
#17
(Get-Process -Name explorer).StartTime
(Get-Process -Name explorer).StartTime.DayOfWeek
#18
$Word =New-Object -ComObject Word.Application
$Word.Visible = $true
$File = ″C:\Users\Vitaliy\OneDrive\Epam\Homework″
$Document = $Word.Document.Open($File)
#19
$i=0
$n=10
$s=0
Do {$i++;$s=$s+$i*3;Write-host 'step'$i;Write-host 'sum='$s}
While ($i -lt $n)
#20
function Sum-vi ([int]$n)
{
$i=0
$s=0
Do {$i++;$s=$s+$i*3;Write-host 'step'$i;Write-host 'sum='$s}
While ($i -lt $n)}
