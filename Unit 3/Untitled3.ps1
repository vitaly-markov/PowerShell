#1.1
function Write-RunningServiceToFile {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, HelpMessage="Enter file path with name to save and get content")]
        $txtfileName ='c:\myservices.txt'
    )
    Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File -FilePath $txtfileName
}

function Read-DiskContent {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, HelpMessage="Enter disk name to get content")]
        $disk='c:'
    )
    Get-ChildItem -Path $disk
}

function Read-FileContent {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, HelpMessage="Enter file path with name to save and get content")]
        $txtfileName ='c:\myservices.txt'
    )
    Get-Content $txtfileName
}

#1.2
function Measure-SumOfNumericVariables {
    [CmdletBinding()]
    param()
    (Get-Variable | ForEach-Object { if($_.Value -is [int]) {$_.Value}} | Measure-Object -Sum).Sum
}

#1.3
function Get-LongestProcesses {
    [CmdletBinding()]
    param()
    Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
}

#1.3.1
function Set-CustomScheduleTask {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false, HelpMessage="Enter New-JobTrigger settings")]
        $scheduleTask = (New-JobTrigger -Once -At $(Get-Date) -RepetitionInterval(New-TimeSpan -Minutes 10) -RepetitionDuration(New-TimeSpan -Hours 1))
    )
    Register-ScheduledJob -Name StartMyScript -FilePath C:\Scripts\task3_0-1.4.ps1 -Trigger $scheduleTask
}

#1.4
function Measure-SizeOfFiles {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false, HelpMessage="Enter directory to get files size")]
        $directory='c:\windows\'
    )
    (Get-ChildItem $directory -File -Recurse -Exclude *.tmp | Measure-Object -Sum Length).Sum / 1GB
}