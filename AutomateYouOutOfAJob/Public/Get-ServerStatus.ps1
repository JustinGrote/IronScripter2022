function Get-ServerStatus {
    <#
    .SYNOPSIS
    Monitors the performance of the server
    #>
    [CmdletBinding()]
    param(

        [String]$ComputerName,
        [int]$Lines = 10,
        [int]$RefreshSec = 1
    )

    while ($true) {
        Clear-Host

        Get-Process
        | Select-Object -First 10
        | Sort-Object CPU
        | Format-Table -AutoSize

        Start-Sleep $refreshSec
    }
}
