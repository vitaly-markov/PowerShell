#1
    #reboot VMs from Host
    Get-WmiObject -namespace root\virtualization\v2 Msvm_ComputerSystem | % { $_.requeststatechange(10) }

    Invoke-Command -Credential administrator -VMName MARKOV_VM1, MARKOV_VM2, MARKOV_VM3 {
        (gwmi win32_operatingsystem -EnableAllPrivileges).Reboot()
    }
#2
    Invoke-Command -Credential administrator  -VMName MARKOV_VM2 {Get-WmiObject -Class Win32_Process | Select-Object ProcessName -Unique}
#3
    #enable PowerShellRemoting
    Enable-PSRemoting
    #check PowerShellRemoting State
    Invoke-Command -Credential administrator -VMName MARKOV_VM1, MARKOV_VM2, MARKOV_VM3 {Get-Service WinRM}
    Invoke-Command -Credential administrator -VMName MARKOV_VM1, MARKOV_VM2, MARKOV_VM3 {Test-WSMan}
#4
    Invoke-Command -Credential administrator -VMName MARKOV_VM2 {Set-Item WSMan:\localhost\listener\listener*\port -Value 42658}    
    Invoke-Command -Credential administrator -VMName MARKOV_VM2 {Get-Item WSMan:\localhost\listener\listener*\port}
#5
    New-PSSessionConfigurationFile -Path .\diskContent.pssc -ModulesToImport Get-ChildItem
    Test-PSSessionConfigurationFile .\diskContent.pssc
    Register-PSSessionConfiguration -Path .\diskContent.pssc -Name DiskContent
