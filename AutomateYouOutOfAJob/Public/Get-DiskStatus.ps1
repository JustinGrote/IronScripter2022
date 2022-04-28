Function Get-DiskStatus
{
    <#
    .SYNOPSIS
    Displays the disk usage
    #>

    [CmdletBinding()]
    param(
        #The name of the computer to connect to, defaults to localhost
        [String][Alias('Hostname')]$ComputerName,

        [PSCredential]$Credential,

        [Parameter(Mandatory= $False)]
        [String]$MinFree,

        [Parameter(Mandatory= $False)]
        [String]$FilterNames
    )

    $icmParams = @{}

    #Hostname implicitly uses SSH as opposed to ComputerName, that's why we specify it here
    if ($ComputerName) { $icmParams.HostName = $ComputerName }
    if ($Credential) { $icmParams.Credential = $Credential }

    $ListOfVolumes  Invoke-Command @icmParams {
         Get-Volume;
    }

    $ListOfVolumes | Foreach-object {
        $_.DriveLetter
    }

}