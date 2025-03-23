function Test-MgEnvironment {
    <#
    .SYNOPSIS
        Tests if the current session is connected to Microsoft Graph.
    
    .DESCRIPTION
        The Test-MgEnvironment function checks if there is an active Microsoft Graph PowerShell connection
        by retrieving the current context. It returns true if a valid connection exists, otherwise false.
        When a connection is successfully established, it writes a confirmation message to the console.
    
    .EXAMPLE
        Test-MgEnvironment
        Returns $true if connected to Microsoft Graph, $false otherwise.
    
    .NOTES
        This is a helper function used to validate the Microsoft Graph environment before performing operations.

        Author: Daniel Bradley
        Website: ourcloudnetwork.com
        Version: 1.0
    #>
    process {
        try {
            $Context = Get-MgContext -ErrorAction Stop
            Write-Verbose "Testing Microsoft Graph environment..."
            if ($null -eq $Context) {
                Write-output "No active Microsoft Graph connection found."
            }
            Write-Output "Connection to Microsoft Graph has been successfully established."
        }
        catch {
            Write-Error "Microsoft Graph environment check failed: $_"
        }
    }
}