function Get-MiAccessToken {
    <#
    .SYNOPSIS
        Retrieves an access token from the Azure Managed Identity endpoint.
    
    .DESCRIPTION
        The Get-MiAccessToken function obtains an OAuth access token using the Azure Managed Identity service.
        It communicates with the Managed Identity endpoint and exchanges the identity for a valid access token
        that can be used for authenticating to Azure resources.
    
    .PARAMETER IdentityClientId
        The Client ID of the User-Assigned Managed Identity to use for token acquisition.
        For System-Assigned Managed Identities, this is still required and should be the ID of the identity.
    
    .EXAMPLE
        $token = Get-MiAccessToken -IdentityClientId "00000000-0000-0000-0000-000000000000"
        
        Retrieves an access token using the specified Managed Identity client ID.
    
    .NOTES
        This function requires the environment to have the IDENTITY_ENDPOINT and IDENTITY_HEADER variables available,
        which are automatically set in environments where Managed Identity is enabled.
        
        Author: Daniel Bradley
        Website: ourcloudnetwork.com
        Version: 1.0
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $IdentityClientId
    )
    process {
        try {
            Write-Verbose "Obtaining token from managed identity endpoint..."
            $accessToken = Invoke-RestMethod $env:IDENTITY_ENDPOINT -Method 'POST' -Headers @{
                'Metadata'          = 'true'
                'X-IDENTITY-HEADER' = $env:IDENTITY_HEADER
            } -ContentType 'application/x-www-form-urlencoded' -Body @{
                'resource'  = 'api://AzureADTokenExchange'
                'client_id' = $IdentityClientId
            }
            if ($accessToken){
                Write-Verbose "Token obtained successfully."
                return $accessToken.access_token
            }
            else {
                Throw "Failed to obtain token from managed identity endpoint."
                return $false
            }
        }
        catch {
            Throw "Failed to obtain token from managed identity endpoint."
            return $false
        }
    }
}