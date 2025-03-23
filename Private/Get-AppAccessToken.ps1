function Get-AppAccessToken {
    <#
    .SYNOPSIS
        Exchanges a Managed Identity token for an access token to access resources in another tenant.
    
    .DESCRIPTION
        The Get-AppAccessToken function takes a Managed Identity access token and exchanges it 
        for an application access token to access Microsoft Graph in a target tenant. This implements
        the OAuth 2.0 token exchange flow using the client credentials grant with assertion.
    
    .PARAMETER targetTenantId
        The ID of the target tenant where resources will be accessed.
        
    .PARAMETER accessToken
        The source access token obtained from the Managed Identity endpoint.
        
    .PARAMETER clientId
        The Client ID of the application registration that's been configured for cross-tenant access.
    
    .EXAMPLE
        $graphToken = Get-AppAccessToken -targetTenantId "00000000-0000-0000-0000-000000000000" -accessToken $miToken -appRegistrationClientId "11111111-1111-1111-1111-111111111111"
        Exchanges a Managed Identity token for an access token to the target tenant.
    
    .NOTES
        This function implements a token exchange pattern where a token from one source is used to authenticate
        and request a new token for a different resource or tenant.
        
        Author: Daniel Bradley
        Website: ourcloudnetwork.com
        Version: 1.0
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $targetTenantId,
        [Parameter(Mandatory = $true)]
        [string] $accessToken,
        [Parameter(Mandatory = $true)]
        [string] $clientId
    )
    process {
        try {
            $appAccessToken = Invoke-RestMethod "https://login.microsoftonline.com/$targetTenantId/oauth2/v2.0/token" -Method 'POST' -Body @{
                client_id             = $clientId
                scope                 = 'https://graph.microsoft.com/.default'
                grant_type            = "client_credentials"
                client_assertion_type = "urn:ietf:params:oauth:client-assertion-type:jwt-bearer"
                client_assertion      = $accessToken
            }
            if(-not $appAccessToken.access_token) {
                throw "Failed to acquire access token for tenant: $targetTenantId"
            } else {
                return $appAccessToken.access_token
            }
        }
        catch {
            Write-Error "Aquiring access token failed: $_"
            return $false
        }
    }
}