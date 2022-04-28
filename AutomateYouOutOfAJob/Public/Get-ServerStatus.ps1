function Get-ServerStatus {
    <#
    .SYNOPSIS
    Monitors the performance of the server in real time
    #>
    [CmdletBinding()]
    param(
        #The name of the computer to connect to, defaults to localhost
        [String]$ComputerName,
        [PSCredential]$Credential,
        [int]$Lines = 10,
        [int]$RefreshSec = 1
    )

    while ($true) {
        Clear-Host
        $icmParams = @{}

        if ($ComputerName) { $icmParams.ComputerName = $ComputerName }
        if ($Credential) { $icmParams.Credential = $Credential }

        Invoke-Command @icmParams {
            Get-Process
            | Select-Object -First 10
            | Sort-Object CPU
            | Format-Table -AutoSize

            Start-Sleep $refreshSec

        }

    }
}
