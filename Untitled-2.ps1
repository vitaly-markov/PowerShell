#1
get-psdrive
cd HKCU:\
Get-ChildItem
#2
New-Item -ItemType Directory -path "c:\vvvm"
Rename-ItemProperty -path "c:\vvvm" -name Param1 -newname Параметр1
Remove-Item "c:\vvvm"
#3
New-PSDrive -Name Serv –PSProvider FileSystem -Root "C:\M2T2_Markov"
#4
Get-Service | Format-Table -AutoSize | Out-File -filepath "Serv:\AllServices.txt"|
Get-ChildItem -Path "Serv:\" -Force
get-content -Path "Serv:\AllServices.txt"
#6
Get-Process | Get-Item | Sort  CPU -desc |
Select Directory, Name, CreationTime, LastWriteTime ,CPU(s) -last 6
#7
Get-Process | foreach-object{

    if ($_.CPU -gt "100") {
    
    write-host -f red $.Name "-" $.VM}`
    
    else{ write-host -f green $.Name "-" $.VM}}
#8
(Get-ChildItem C:\windows -recurse -Force -exclude *.tmp | Measure-Object -Property Length -Sum).Sum / 1Mb
#9
Get-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft | Out-File d:\M2T9.csv
#10
Get-History | Out-File d:\M2T10.xml
#11
Add-History -InputObject (Import-Clixml -Path d:\M2T10.xml)
Get-History
#12
Remove-Item C:\M2T2_Markov
Remove-PSDrive -name M2T2_Markov