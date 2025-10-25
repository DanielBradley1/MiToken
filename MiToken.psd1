@{
RootModule = 'MiToken.psm1'
ModuleVersion = '0.1.3'
GUID = 'df45e3ce-0c54-4988-92a3-2755b9c53262' # Randomly generated GUID
Author = 'Daniel Bradley'
CompanyName = 'ourcloudnetwork.com'
Copyright = '(c) ourcloudnetwork. All rights reserved.'
Description = 'A PowerShell module to obtain an managed identity token and exchange it for an access token to access multi-tenant resources.'
FunctionsToExport = @('Connect-MiGraph','Get-MiToken')
CmdletsToExport = @()
VariablesToExport = @()
AliasesToExport = @()
PrivateData = @{
        PSData = @{
            Tags = @('MicrosoftGraph', 'Authentication', 'Token')
            LicenseUri = 'https://github.com/DanielBradley1/MiToken/blob/main/LICENSE'
            ProjectUri = 'https://github.com/DanielBradley1/MiToken'
            # IconUri = ''
            # ReleaseNotes = ''
            ExternalModuleDependencies = @('Microsoft.Graph.Authentication')
        }
    }
}
