﻿#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: 1ed05080-3b9b-488e-8ddf-3e04cb565a5d
# Source File: C:\Users\mcarmean\Documents\GitHub\powershell\ADUserLookup.psf
#------------------------------------------------------------------------

<#
    .NOTES
    --------------------------------------------------------------------------------
     Code generated by:  SAPIEN Technologies, Inc., PowerShell Studio 2015 v4.2.82
     Generated on:       4/24/2015 12:04 PM
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
function Call-ADUserLookup_psf {

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
	$formAccountSearch = New-Object 'System.Windows.Forms.Form'
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
	
	
	$formAccountSearch_Load={
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
		$formAccountSearch.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonSearch.remove_Click($buttonSearch_Click)
			$formAccountSearch.remove_Load($formAccountSearch_Load)
			$formAccountSearch.remove_Load($Form_StateCorrection_Load)
			$formAccountSearch.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch [Exception]
		{ }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$formAccountSearch.SuspendLayout()
	#
	# formAccountSearch
	#
	$formAccountSearch.Controls.Add($buttonSearch)
	$formAccountSearch.Controls.Add($labelLastName)
	$formAccountSearch.Controls.Add($textboxSearch)
	$formAccountSearch.Controls.Add($textbox1)
	$formAccountSearch.ClientSize = '635, 402'
	#region Binary Data
	$formAccountSearch.Icon = [System.Convert]::FromBase64String('
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
778AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAUAMK/FADC/xQAwv8UAML/FADC/xQAwv8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADRPhAA0L1gAQ/878FO/H/BTnuvwAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQAwr8UAML/FADC
/xQAwv8UAML/FADC/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGOO4gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFADCvxQAwv8UAML/FADC/xQAwv8UAML/AAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAUAMK/FADC/xQAwv8UAML/FADC/xQAwv8AAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQA
wr8UAML/FADC/xQAwv8UAML/FADC/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFADCnxQAwv8UAML/FADC/xQA
wv8UAML/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFADCIBQAwmAUAMKfFADC3xQAwv8AAAAAAAAAAAAA
AAAAAAAA////////+AD4Af+B+AH4AOAAfgHgAHgAwAB8AcAAeACA4HwBgAB4AIHwfA+B4HgAg/B8
DwHgeACB8HwPA+B4AIDwfA8D4HgAgDB8DwPgeADAAHwPA+B4AOAAfA8D4HgA+AA8DwPgeAD/AAAP
A+B4AP/gAA8B4HgA/+AAD4HgeAD/4HADgOB4AOCA/AAAIHgAwAH8AAAAeADAAfwPAAB4APAH/A/w
AHgA/7/8D/8AeAD///wP/+B4AP///A//4HgA///8D//geAD///wP/+B4AP///w//4HgA///////g
eAD//////+B4AP//////4HgA///////geAD///////x4AA==')
	#endregion
	$formAccountSearch.Name = "formAccountSearch"
	$formAccountSearch.Text = "Account Search"
	$formAccountSearch.add_Load($formAccountSearch_Load)
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
	$textbox1.Anchor = 'Top, Bottom, Left, Right'
	$textbox1.Font = "Courier New, 8.25pt"
	$textbox1.Location = '9, 67'
	$textbox1.Multiline = $True
	$textbox1.Name = "textbox1"
	$textbox1.ScrollBars = 'Both'
	$textbox1.Size = '614, 326'
	$textbox1.TabIndex = 2
	$formAccountSearch.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formAccountSearch.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formAccountSearch.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formAccountSearch.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $formAccountSearch.ShowDialog()

} #End Function

#Call the form
Call-ADUserLookup_psf | Out-Null
