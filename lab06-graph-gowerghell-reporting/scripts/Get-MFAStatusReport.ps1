# Get-MFAStatusReport.ps1
# Purpose: Generate a Microsoft Graph report showing registered MFA methods by user.
# Output: mfa-status-report.csv

param(
    [string]$OutputPath = ".\mfa-status-report.csv"
)

Write-Host "Connecting to Microsoft Graph..." -ForegroundColor Cyan

Connect-MgGraph -Scopes "UserAuthenticationMethod.Read.All", "User.Read.All"

Write-Host "Collecting user authentication methods..." -ForegroundColor Cyan

$users = Get-MgUser -All -Property Id,DisplayName,UserPrincipalName

$report = foreach ($user in $users) {
    try {
        $methods = Get-MgUserAuthenticationMethod -UserId $user.Id

        $mfaMethods = $methods | Where-Object {
            $_.AdditionalProperties.'@odata.type' -ne '#microsoft.graph.passwordAuthenticationMethod'
        }

        [PSCustomObject]@{
            DisplayName       = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            MFAMethodCount    = $mfaMethods.Count
            MFAEnabled        = ($mfaMethods.Count -gt 0)
        }
    }
    catch {
        Write-Warning "Could not retrieve authentication methods for $($user.UserPrincipalName): $($_.Exception.Message)"

        [PSCustomObject]@{
            DisplayName       = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            MFAMethodCount    = "Error"
            MFAEnabled        = "Unknown"
        }
    }
}

$report | Format-Table -AutoSize

$report | Export-Csv -Path $OutputPath -NoTypeInformation

Write-Host "Report exported to $OutputPath" -ForegroundColor Green
