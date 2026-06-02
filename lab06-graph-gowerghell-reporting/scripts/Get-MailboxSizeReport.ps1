# Get-MailboxSizeReport.ps1
# Purpose: Generate a mailbox size and usage report from Exchange Online.
# Output: reports/mailbox-size-report.csv

param(
    [string]$UserPrincipalName = "MarquellProctor@ProctorCloud.onmicrosoft.com",
    [string]$OutputPath = "./reports/mailbox-size-report.csv"
)

Write-Host "Connecting to Exchange Online..." -ForegroundColor Cyan

Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName

Write-Host "Collecting mailbox data..." -ForegroundColor Cyan

$report = Get-Mailbox -ResultSize Unlimited | ForEach-Object {
    $mailbox = $_

    try {
        $stats = Get-MailboxStatistics -Identity $mailbox.PrimarySmtpAddress

        [PSCustomObject]@{
            DisplayName        = $mailbox.DisplayName
            PrimarySmtpAddress = $mailbox.PrimarySmtpAddress
            RecipientType      = $mailbox.RecipientTypeDetails
            TotalItemSize      = $stats.TotalItemSize
            ItemCount          = $stats.ItemCount
            LastLogonTime      = $stats.LastLogonTime
        }
    }
    catch {
        Write-Warning "Could not retrieve statistics for $($mailbox.PrimarySmtpAddress): $($_.Exception.Message)"
    }
}

$report | Format-Table -AutoSize

$report | Export-Csv -Path $OutputPath -NoTypeInformation

Write-Host "Report exported to $OutputPath" -ForegroundColor Green