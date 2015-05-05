﻿<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2015 v4.2.83
	 Created on:   	5/5/2015 9:56 AM
	 Created by:   	Matthew Carmean 
	 Organization: 	ATD 
	 Filename:     	AdManagerNameUpdate.ps1
	===========================================================================
	.DESCRIPTION
		This script runs against the Active Directory Employees OU. It checks each
		employee's user account for extensionAttribute3, which contains their manager's 
		employee ID. Using the employee ID, the script looks up the manager's user account,
		and inserts the manager's distinguishedName into the employee's "manager" attribute.
#>

Import-Module ActiveDirectory

$ad = Get-ADUser -Properties "DisplayName","extensionAttribute3" -SearchBase "OU=Employees,DC=hq,DC=astd,DC=org" -Filter *


foreach ($i in $ad) {
	$managerDN = Get-ADUser -Properties "DisplayName", "distinguishedName", "employeeID" -SearchBase "OU=Employees,DC=hq,DC=astd,DC=org" -Filter * | where { $_.EmployeeID -eq $i.extensionAttribute3 } | select EmployeeID, displayName, distinguishedName
	Write-Host $i.DisplayName, $i.extensionAttribute3
	Write-Host $managerDN.DisplayName, $managerDN.EmployeeID, $managerDN.distinguishedName
}