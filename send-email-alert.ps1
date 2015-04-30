# This script is to alert the IT department via email if the Front End HTTP Proxy connection between the
# hybrid server and CAS server fail. This failure generates an Application Event ID 3005, which triggers
# a task to run the script.


$secpasswd = ConvertTo-SecureString “s3ctyh05%” -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential (“mcarmean@td.org”, $secpasswd)

Send-MailMessage -To "mcarmean@td.org" -Cc "mcarmean@td.org" -SmtpServer "smtp.office365.com" -Credential $mycreds `
-UseSsl "ALERT: Critical Error on Hybrid Server" -Port "587" -Body "This is an automatically generated message.<br><br>Application Event ID 3005: MSExchange Front End HTTP Proxy has been detected on astd-exch-365<br><br>To begin troubleshooting, please first check the time settings on ASTDEXCHCAS and astd-exch-365. Inbound mail will not flow properly while this error is present.<br><br>Thank you<br>" `
-From "mcarmean@td.org" -BodyAsHtml
