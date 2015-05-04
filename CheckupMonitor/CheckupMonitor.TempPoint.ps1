# Server Checkup
# This script is designed to run as a scheduled task on a monitor server, to monitor critical
# services and settings on remote servers. The findings are output in HTML formatto a file for
# viewing as a webpage.

################# START Collect Remote server information ####################

# Server variable for server to be monitored 
$servName = 'astd-exch-cas'

# Get the server IP address via WMI and convert to string
$ip = Get-WmiObject Win32_NetworkAdapterConfiguration | Where {$_.IPAddress.length -gt 0}
$ip = [string]$ip.IPAddress[0]

# Get clock time on server
$time = Get-Date
$time = $time.ToShortTimeString()

################# END Collect server configuration information ####################


################# START Collect service information ####################

# Get critical services
$printSpooler = Get-Service "Print Spooler"
$rdService = Get-Service "Remote Desktop Services"
$sqlServer = Get-Service "SQL Server (MICROSOFTSCM)"
$winBackup = Get-Service "Windows Backup"

################# END Collect service information ####################


################# START Write server information in file ####################

# Gather list of individual server files
$sites = Get-ChildItem -Path "\\hq.astd.org\public\Users\mcarmean\PROJECTS\Scripts\WorkInProgress\Checkup\sites\*.html"

# Iterate through html files in Checkup\sites\ directory
foreach ($serv in $sites){

# Modify the server file name to omit the html file extension
  $s = $serv.Name.TrimEnd(".html")

# Locate the current server file in the sites directory 
  if ($s -eq $servName ){

    # Generate the html for local server in html table 
    $servPrintSpooler = [string]$printSpooler.Status
    $servRDService = [string]$rdService.Status
    $servSqlServer = [string]$sqlServer.Status
    $servWinBackup = [string]$winBackup.Status

    $servPrintSpooler = $servPrintSpooler.ToLower() 
    $servRDService = $servRDService.ToLower()
    $servSqlServer = $servSqlServer.ToLower()
    $servWinBackup = $servWinBackup.ToLower()

    $servHTML = @"
    <tr>`r`n
    `t<td id="serverName">$servName</td>`r`n
    `t<td id="ipAddress">$ip</td>`r`n
    `t<td id="timeStamp">$time</td>`r`n
    `t<td id="service" stat="$servPrintSpooler">Print Spooler</td>`r`n
    `t<td id="service" stat="$servRDService">Remote Desktop Services</td>`r`n
    `t<td id="service" stat="$servSqlServer">SQL Server (MICROSOFTSCM)</td>`r`n
    `t<td id="service" stat="$servWinBackup">Windows Backup</td>`r`n
    </tr>`r`n
"@
  }

}

write-host $servHTML





################# END Write server information in file ####################

<#
	.SYNOPSIS
		A brief description of the Name function.

	.DESCRIPTION
		A detailed description of the Name function.

	.PARAMETER  ParameterA
		The description of a the ParameterA parameter.

	.PARAMETER  ParameterB
		The description of a the ParameterB parameter.

	.EXAMPLE
		PS C:\> Name -ParameterA 'One value' -ParameterB 32
		'This is the output'
		This example shows how to call the Name function with named parameters.

	.EXAMPLE
		PS C:\> Name 'One value' 32
		'This is the output'
		This example shows how to call the Name function with positional parameters.

	.INPUTS
		System.String,System.Int32

	.OUTPUTS
		System.String

	.NOTES
		For more information about advanced functions, call Get-Help with any
		of the topics in the links listed below.

	.LINK
		about_functions_advanced

	.LINK
		about_comment_based_help

	.LINK
		about_functions_advanced_parameters

	.LINK
		about_functions_advanced_methods
#>
function Get-ServerState {
	[CmdletBinding()]
	param(
		[Parameter(Position=0, Mandatory=$true)]
		[System.String[]]
		$Server
		# There's room here to make this accept a file full of servers, and their respective services to monitor.
	)
	begin {
	#	try { # Test-Connection to web here
	#	}
	#	catch {
	#	}
	}
	process {
		foreach ($s in $Server) {
			try {
				# Code for checking server stats/services goes here
			}
			catch {
			}
		}
	}
	end {
		try {
		}
		catch {
		}
	}
}
