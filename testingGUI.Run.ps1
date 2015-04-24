﻿#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: 1ed05080-3b9b-488e-8ddf-3e04cb565a5d
# Source File: C:\Users\mcarmean\Documents\GitHub\powershell\testingGUI.psf
#------------------------------------------------------------------------

<#
    .NOTES
    --------------------------------------------------------------------------------
     Code generated by:  SAPIEN Technologies, Inc., PowerShell Studio 2015 v4.2.82
     Generated on:       4/24/2015 10:15 AM
     Generated by:       mcarmean
     Organization:       ATD
    --------------------------------------------------------------------------------
    .DESCRIPTION
        GUI script generated by PowerShell Studio 2015
#>
#----------------------------------------------
#region Application Functions
#----------------------------------------------

#endregion Application Functions

#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Call-testingGUI_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Core, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.ServiceProcess, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$form1 = New-Object 'System.Windows.Forms.Form'
	$buttonSearch = New-Object 'System.Windows.Forms.Button'
	$labelLastName = New-Object 'System.Windows.Forms.Label'
	$textboxSearch = New-Object 'System.Windows.Forms.TextBox'
	$textbox1 = New-Object 'System.Windows.Forms.TextBox'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	Import-Module ActiveDirectory
	
	
	$form1_Load={
		#TODO: Initialize Form Controls here
		
	}
	
	$buttonSearch_Click={
		#TODO: Place custom script here
		$user = $textboxSearch.Text
		$textbox1.Text = Get-ADUser -Filter * | where {$_.surname -like "*$user*"} | Format-Table -Property Name, samAccountName -AutoSize | Out-String
	}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$form1.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonSearch.remove_Click($buttonSearch_Click)
			$form1.remove_Load($form1_Load)
			$form1.remove_Load($Form_StateCorrection_Load)
			$form1.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch [Exception]
		{ }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$form1.SuspendLayout()
	#
	# form1
	#
	$form1.Controls.Add($buttonSearch)
	$form1.Controls.Add($labelLastName)
	$form1.Controls.Add($textboxSearch)
	$form1.Controls.Add($textbox1)
	$form1.ClientSize = '635, 402'
	$form1.Name = "form1"
	$form1.Text = "Form"
	$form1.add_Load($form1_Load)
	#
	# buttonSearch
	#
	$buttonSearch.Location = '9, 38'
	$buttonSearch.Name = "buttonSearch"
	$buttonSearch.Size = '75, 23'
	$buttonSearch.TabIndex = 5
	$buttonSearch.Text = "Search"
	$buttonSearch.UseVisualStyleBackColor = $True
	$buttonSearch.add_Click($buttonSearch_Click)
	#
	# labelLastName
	#
	$labelLastName.Location = '9, 15'
	$labelLastName.Name = "labelLastName"
	$labelLastName.Size = '74, 20'
	$labelLastName.TabIndex = 4
	$labelLastName.Text = "Last Name:"
	#
	# textboxSearch
	#
	$textboxSearch.Location = '89, 12'
	$textboxSearch.Name = "textboxSearch"
	$textboxSearch.Size = '153, 20'
	$textboxSearch.TabIndex = 3
	#
	# textbox1
	#
	$textbox1.Font = "Courier New, 8.25pt"
	$textbox1.Location = '9, 67'
	$textbox1.Multiline = $True
	$textbox1.Name = "textbox1"
	$textbox1.ScrollBars = 'Both'
	$textbox1.Size = '614, 326'
	$textbox1.TabIndex = 2
	$form1.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $form1.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$form1.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$form1.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $form1.ShowDialog()

} #End Function

#Call the form
Call-testingGUI_psf | Out-Null
