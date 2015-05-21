﻿
Import-Module PSWorkflowUtility

function Get-ServerState {
	[CmdletBinding()]
	param(
		[Parameter(Position=0, Mandatory=$true)]
		[System.String[]]$ComputerName,
		[Parameter(Position = 1, Mandatory = $true)]
		[System.String[]]$Service
		# There's room here to make this accept a file full of servers, and their respective services to monitor.
	)
	begin {
	}
	process {
		foreach ($c in $ComputerName) {
			
				$ping = Test-Connection -ComputerName $c -Quiet
			if ("$ping" -eq "False") {
					#Write-Host "Ping Failed"
					break
				}
				else {
					# Querying the remote server for config and service info
					$sess = New-PSSession -ComputerName $c
					#Write-Host "New session $sess created."
					
					$ipInfo = Invoke-Command -Session $sess -ScriptBlock { Get-WmiObject Win32_NetworkAdapterConfiguration | Where { $_.IPAddress.length -gt 0 } }
					$ipV4 = [string]$ipInfo.IPAddress[0]
					#Write-Host "IPv4 info is: $ipv4"
					
					$timeInfo = Invoke-Command -Session $sess -ScriptBlock { Get-Date }
					$time = $timeInfo.ToShortTimeString()
					#Write-Host "Time info: $time"
					
					# Collect service information
					$serviceTable = @{ }
					#Write-Host "Empty service table created."
					
					foreach ($s in $Service) {
						$serviceObject = Get-Service $s -ComputerName $c
						#Write-Host "Service object created $s"
						$serviceTable.Add($serviceObject.Name, $serviceObject.Status)
						#Write-Host "Service info added to serviceTable"
					}
				
					$properties = @{
						Name = $c
						IP = $ipV4
						Time = $time
						Service = $serviceTable
					}
				
					New-Object -TypeName PSObject -Property $properties
					 
				}
			}
	}
	
	#end {
#		try {
#		}
#		catch {
#		}
#}
}

$Computers = @("astd-hq-dfs03","1476-mcarmean","astd-hq-dc04")
foreach ($i in $Computers) {
	$CurrentComputer = Get-ServerState $i spooler, defragsvc, gpsvc
	Write-Output $CurrentComputer.Name, $CurrentComputer.Time, $CurrentComputer.IP
	foreach ($s in $CurrentComputer.Service.GetEnumerator()) {
		Write-Output $s.Name,$s.Value 	
	}
}
