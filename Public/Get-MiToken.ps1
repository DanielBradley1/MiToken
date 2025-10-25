function Get-MiToken {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)]
        [string]$TenantId,
        
        [Parameter(Mandatory=$false)]
        [string]$ClientId,
        
        [Parameter(Mandatory=$false)]
        [string]$IdentityClientId,

        [Parameter(Mandatory=$false)]
        [ValidateSet('MicrosoftGraph', 'MicrosoftTeams')]
        [string]$Scope = 'MicrosoftGraph'
    )
    process {
        $scopeUrl = switch ($Scope) {
            'MicrosoftGraph' { 'https://graph.microsoft.com/.default' }
            'MicrosoftTeams' { '48ac35b8-9aa8-4d74-927d-1f4a14a0b239/.default' }
        }

        try {
            $miToken = Get-MiAccessToken -IdentityClientId $IdentityClientId
            $appAccessToken = Get-AppAccessToken -targetTenantId $TenantId -accessToken $miToken -ClientId $ClientId -Scope $scopeUrl
            return $appAccessToken
        }
        catch {
            Write-Error "Failed to obtain access token for service: $Scope"
        }
    }
}