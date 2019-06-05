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
