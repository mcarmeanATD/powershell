# Server Checkup
# This script is designed to run as a scheduled task on a server, to monitor critical
# services and settings. The findings are configured to be output in XML format to a 
# designated file. The XML file can then be formatted for viewing using JS or XSLT.


################# START Load/Initialize XML file ####################

# Path to the XML file
$path = "\\hq.astd.org\public\users\mcarmean\projects\Scripts\WorkInProgress\index.html"


# Create an object to hold the contents of the XML file
[xml]$xmlFile = New-Object -TypeName XML


# Load the XML file into the newly created object
$xmlFile.Load($path)


# Update the XML file version record
$currentVersion = $xmlFile.allServers.version


# Convert version type of string to int to increment, then convert back to string and overwrite allServers.version value
$currentVersion = [int]$currentVersion
$updatedVersion = $currentVersion + 1
$updatedVersion = [string]$updatedVersion
$xmlFile.allServers.version = $updatedVersion

################# END Load/Initialize XML file ####################


################# START Collect server configuration information ####################

# Get the server IP address via WMI and convert to string
$ip = Get-WmiObject Win32_NetworkAdapterConfiguration | Where {$_.IPAddress.length -gt 0}
$ip = [string]$ip.IPAddress[0]


# Get server name via CIM (beacuse, why not?) and convert to string
$cimSystem = Get-CimInstance CIM_System
$servName = [string]$cimSystem.Name[0]

################# END Collect server configuration information ####################


################# START Collect service information ####################

# Get critical services
$printSpooler = Get-Service "Print Spooler"
$rdService = Get-Service "Remote Desktop Services"
$sqlServer = Get-Service "SQL Server (MICROSOFTSCM)"
$winBackup = Get-Service "Windows Backup"

################# END Collect service information ####################


################# START Update server information in XML file ####################

# Retreive all server elements from the XML file to parse for current server
$everyServer = $xmlFile.allServers.server


# Locate the current server in the XML file
foreach ($serv in $everyServer){

  if ($serv.name -eq $servName){

    # Set the ipAddress element with the current IP address (hopefully the IP hasn't changed)
    $serv.ipAddress = $ip

    $serv.printSpooler = [string]$printSpooler.Status
    $serv.rdService = [string]$rdService.Status
    $serv.sqlServer = [string]$sqlServer.Status
    $serv.winBackup = [string]$winBackup.Status

  }

}


# Save all changes
$xmlFile.Save($path)

################# END Update server information in XML file ####################


