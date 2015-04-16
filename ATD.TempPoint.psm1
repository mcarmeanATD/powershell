
Import-Module CimCmdlets
function Get-ComputerInfo {
[CmdletBinding()]
param(
  [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
  [string[]]$computerNames
)

Process{
  Foreach ($computername in $computerNames) {
    $c = Get-CimInstance Win32_ComputerSystem -ComputerName $computerName
    $b = Get-CimInstance Win32_BIOS -ComputerName $computerName
	$a = Get-CimInstance Win32_OperatingSystem -ComputerName $computername

    $cMemory = ("{0,12:n0} MB" -f ($c.TotalPhysicalMemory/1MB))

    $properties = @{
      Name = $c.Name
      Manufacturer = $c.Manufacturer
      Model = $c.Model
      NumberOfLogicalProcessors = $c.NumberOfLogicalProcessors
	  Memory = $cMemory
	  OS = $a.caption
      SystemType = $c.SystemType
      BIOS = $b.Name
      SerialNumber = $b.SerialNumber
    }

    New-Object -TypeName PSObject -Property $properties
  }
}
}

function Invoke-DCReplication {
  Write-Host "Beginning AD Replication"
  Write-Host "=========================="

  # Find each domain controller, then do a foreach-object
  Get-ADDomainController -filter * | % {

    Write-Host "Replicating $($_.Name)"

    # Recalculate topology for this server
    $null = repadmin /kcc $_.Name

    # Replicate it
    $null = repadmin /syncall /A /e $_.Name
  }

  Write-Host "=========================="
  Write-Host "Completed AD Replication"
}