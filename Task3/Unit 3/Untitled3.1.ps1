#1.5.1
function Write-WinUpdatesToCSV {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, HelpMessage="Enter csv  to save content")]
        $csvfileName='c:\winupdates.csv'
    )
    Get-HotFix | Export-Csv $csvfileName
}

#1.5.2
function Write-HKLMtoXML {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, HelpMessage="Enter xml to save content")]
        $xmlfileName = 'c:\regHKLM.xml'
    )
    Get-ChildItem HKLM:\SOFTWARE\Microsoft | Export-Clixml $xmlfileName
}

