#
#
#

Function Get-DiskStatus
{
    <#
    .SYNOPSIS
    Displays the disk usage
    #>
    [CmdletBinding()]
    param(
        #The name of the computer to connect to, defaults to localhost
        [String]$ComputerName,

        [PSCredential]$Credential,

        [Parameter(Mandatory= $False)]
        [String]$MinFree,

        [Parameter(Mandatory= $False)]
        [String]$FilterNames
    )

    $ListOfVolumes = Get-Volume;

    $ListOfVolumes | Foreach-object {
        $_.DriveLetter
    }

}