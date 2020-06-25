#############################################################
#Purpose: Logging into Office365, Pull Down Accounts and Email #
#the results. Very Insecure, this is for demonstration      #
#purposed only on how to connect and send data.             #
#############################################################
get-command clear-host | Select-Object -expand Definition
$space = New-Object System.Management.Automation.Host.BufferCell
$space.Character = ' '
$space.ForegroundColor = $host.ui.rawui.ForegroundColor
$space.BackgroundColor = $host.ui.rawui.BackgroundColor
$rect = New-Object System.Management.Automation.Host.Rectangle
$rect.Top = $rect.Bottom = $rect.Right = $rect.Left = -1
$origin = New-Object System.Management.Automation.Host.Coordinates
$Host.UI.RawUI.CursorPosition = $origin
$Host.UI.RawUI.SetBufferContents($rect, $space)
Function Clear-Host { [System.Console]::Clear() }
# Importing MsOnline Module
Write-Host "Importing Module: MsOnline" -ForegroundColor Blue
Import-Module MsOnline
Where-Object {$_.Name -like "AA*" -or $_.Name -like "BB*" -and $_.Enabled -ne $TRUE } |
#############################################################
Write-Host "Importing Module MSOnline" -ForegroundColor Green
$User = "youraccounthere@yourdomain.com"
$Pass = "yourpasswordhere"
$creds = New-Object System.Management.Automation.PSCredential($User,(ConvertTo-SecureString $Pass -AsPlainText -Force));
$filestamp = $((Get-Date).ToString('MM-dd-yyyy_hh-mm-ss'))
Write-Host "Connecting To Microsoft Online Service" -ForegroundColor Green
### Prompt for Login
# Connect-MsolService
Connect-MsolService -Credential $creds
Write-Host "Saving File" -ForegroundColor Yellow
Get-MsolUser -All | ft displayname , Licenses | Out-File c:\audits\users_$filestamp.csv
Write-Host "Closing Connection To Microsoft Online Service" -ForegroundColor Red
Remove-Module MsOnline
#############################################################
Add-PSSnapin Microsoft.Exchange.Management.Powershell.Admin -erroraction silentlyContinue
# Mail Account Settings
$User = "youraccounthere@yourdomain.com"
$Pass = "yourpasswordhere"
$creds = New-Object System.Management.Automation.PSCredential($User,(ConvertTo-SecureString $Pass -AsPlainText -Force));
# Mail Message
$from = "youraccounthere@yourdomain.com"
$to = "youraccounthere@yourdomain.com"
$subject = "Automated Office 365 User Audit"
$body = "Attached are the Office 365 Users for this week for YOURCOMPANYNAMEHERE - Date & Time: $filestamp."
$hasAttachment = $true
$attachmentPath = "c:\audits\users_$filestamp.csv"
$attachment = New-Object System.Net.Mail.Attachment($attachmentPath, 'text/plain')
$mailmessage.Attachments.Add($attachment)
# Mail Server Settings
$server = "outlook.office.com"
$serverPort = 587
$timeout = 30000          # timeout in milliseconds
$enableSSL = $true
$implicitSSL = $false
# Get user credentials if required
#if ($enableSSL)
#{
#    $credentials = [Net.NetworkCredential](Get-Credential)
#}
if (!$enableSSL -or !$implicitSSL)
{
    # Set up server connection
    $smtpClient = New-Object System.Net.Mail.SmtpClient $SMTPServer, $serverPort
    $smtpClient.EnableSsl = $enableSSL
    $smtpClient.Timeout = $timeout
    if ($enableSSL)
    {
        $smtpClient.UseDefaultCredentials = $false;
        $smtpClient.Credentials = $creds
    }
    # Create mail message
    $message = New-Object System.Net.Mail.MailMessage $from, $to, $subject, $body
    if ($hasAttachment)
    {
        $attachment = New-Object System.Net.Mail.Attachment $attachmentPath
        $message.Attachments.Add($attachment)
    }
    # Send the message
    Write-Output "Sending email to $to..."
    try
    {
        $smtpClient.Send($message)
        Write-Output "Message sent."
    }
    catch
    {
        Write-Error $_
        Write-Output "Message send failed."
    }
}
