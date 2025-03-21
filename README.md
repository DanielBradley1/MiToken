# MiToken

MiToken is a PowerShell module designed to simplify authentication and token management for Microsoft Graph API.

## Installation

```powershell
# Install from PSGallery (when published)
Install-Module -Name MiToken -Scope CurrentUser

# Or clone this repository
git clone https://github.com/DanielBradley1/MiToken.git
```

## Usage

### Connect to Microsoft Graph

```powershell
# Import the module
Import-Module MiToken

# Connect with default settings
Connect-MiGraph

# Connect with specific tenant and client ID
Connect-MiGraph -TenantId "contoso.onmicrosoft.com" -ClientId "00000000-0000-0000-0000-000000000000"

# Connect with custom scopes
Connect-MiGraph -Scopes "User.Read", "Mail.Read"
```

## Features

- Simple authentication to Microsoft Graph API
- Token management
- Environment verification

## Requirements

- PowerShell 5.1 or later
- Windows PowerShell or PowerShell Core

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.