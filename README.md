<a href="https://www.linkedin.com/in/danielbradley2/" style="display: flex; align-items: center; text-decoration: none; margin-bottom: 16px;">
  <img src="https://www.svgrepo.com/show/271118/linkedin.svg" width="25" style="vertical-align: middle;">
  <span style="vertical-align: middle; margin-left: 8px;">Connect with me!</span>
</a>


# <div style="display: flex; align-items: center;"><span>MiToken</span><img src="https://learn.microsoft.com/en-us/graph/images/hub/icon04-graphtoolkit.svg" width="45" height="45" style="margin-left: 10px;"></div>

MiToken is a PowerShell module designed to be used with PowerShell Azure Automation runbooks. It will obtain an access token from the managed identity endpoint from within your runbook, then exchange it for a mulit-tenant app access token, using the managed identity token as an assertion. 

This will allow you to connect to external tenants that have provided consent to your multi-tenant application via Microsoft Graph PowerShell in a managed identity scenario.

## Support
This MiToken module is provided 'as in' and has only been tested from within an Azure Automation runbook. Currently it is known to work with the latest Microsoft Graph PowerShell module (v2.6.1) and the PowerShel v7.4 runtime environment.

## Requirements

- **PowerShell 7** or later
- **Microsoft.Graph.Authentication** module
- To be run from a **managed identity** environment

## Installation

```powershell
# Install from PSGallery
Install-Module -Name MiToken -Scope CurrentUser

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

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.