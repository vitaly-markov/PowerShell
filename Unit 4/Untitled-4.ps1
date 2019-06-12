#1
Get-WmiObject -List * -NameSpace root -Recurse
#2
    Get-WmiObject -Namespace Root -Recurse -Class __NAMESPACE | ForEach-Object { $_.name }
#3
    Get-WmiObject -List | Where-Object {$_.name -match "printer"}
#4
    Get-WMIObject win32_operatingsystem | Select-Object PSComputerName, Status, Name, FreePhysicalMemory, 
    Version,  LocalDateTime, Manufacturer, CurrentTimeZone, FreeVirtualMemory, NumberOfProcesses, Caption
#5
    Get-WmiObject -Class Win32_Bios
#6
    Get-WmiObject win32_logicaldisk | Select-Object DeviceID, FreeSpace
    (Get-WmiObject win32_logicaldisk | ForEach-Object { $_.FreeSpace} | Measure-Object -Sum).Sum / 1GB
#7
    Get-WmiObject -Class Win32_PingStatus -Filter "Address='8.8.8.8'" | Select-Object Address, ResponseTime, StatusCode
#9
Register-WmiEvent -query "select * from win32_ProcessStartTrace where processname = 'WINWORD.EXE'" -SourceIdentifier "Process Startes" -Action { Write-Host "OFFICE start" }
