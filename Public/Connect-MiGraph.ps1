function Connect-MiGraph {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)]
        [string]$TenantId,
        
        [Parameter(Mandatory=$false)]
        [string]$ClientId,
        
        [Parameter(Mandatory=$false)]
        [string]$IdentityClientId
    )
    process {
        try {
            $miToken = Get-MiAccessToken -IdentityClientId $IdentityClientId
            $appAccessToken = Get-AppAccessToken -targetTenantId $TenantId -accessToken $miToken -ClientId $ClientId
            $secureToken = ConvertTo-SecureString -String $appAccessToken -AsPlainText
            try {
                Connect-MgGraph -AccessToken $secureToken -nowelcome
            }
            catch {
                Write-Error "Failed to connect to Microsoft Graph: $_"
            }
            Test-MgEnvironment
        }
        catch {
            Write-Error "Failed to connect to Microsoft Graph: $_"
        }
    }
}