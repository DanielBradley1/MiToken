# MiToken ![img](https://ourcloudnetwork.com/wp-content/uploads/2025/03/GraphLogo45.png)

MiToken is a PowerShell module designed to be used with PowerShell Azure Automation runbooks. It will obtain an access token from the managed identity endpoint from within your runbook, then exchange it for a multi-tenant app access token, using the managed identity token as an assertion. 

This will allow you to connect to external tenants that have provided consent to your multi-tenant application via Microsoft Graph PowerShell in a managed identity scenario.

🔗[Connect with me on LinkedIn](https://www.linkedin.com/in/danielbradley2/)

## Support
This MiToken module is provided 'as is' and has only been tested from within an Azure Automation runbook. Currently it is known to work with the latest Microsoft Graph PowerShell module (v2.6.1) and the PowerShel v7.4 runtime environment.

## Requirements

- **PowerShell 7** or later
- **Microsoft.Graph.Authentication** module (required dependency)
- To be run from a **managed identity** environment

## Installation

```powershell
# Install Microsoft.Graph.Authentication dependency first
Install-Module -Name Microsoft.Graph.Authentication

# Install MiToken from PSGallery
Install-Module -Name MiToken

# Or clone this repository
git clone https://github.com/DanielBradley1/MiToken.git
```

## Usage

### Connect to Microsoft Graph

```powershell
# Import the module
Import-Module MiToken

# Connect with specific tenant and client ID. All parameters are mandatory.
Connect-MiGraph -TenantId "TENANT_ID" -ClientId "CLIENT_ID" -IdentityClientId "MANAGED_IDENTITY_CLIENT_ID"
```

### Connect to Microsoft Teams

```powershell
# Import the module
Import-Module MiToken

# Obtain an access token for Microsoft Graph
$GraphToken = Get-MiToken `
-TenantId "xxxxx" `
-ClientId "xxxxx" `
-IdentityClientId "xxxxx" `
-Scope "https://graph.microsoft.com/.default"

# Obtain an access token for Microsoft Teams
$TeamsToken = Get-MiToken `
-TenantId "xxxxx" `
-ClientId "xxxxx" `
-IdentityClientId "xxxxx" `
-Scope "48ac35b8-9aa8-4d74-927d-1f4a14a0b239/.default"

Connect-MicrosoftTeams -AccessTokens @("$GraphToken", "$TeamsToken")
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.