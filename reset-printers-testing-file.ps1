# Testing file for reset-printers script modules

# Get printerlist, driverlist, gpmembership and populate variables accordingly

$allPrinterInfo = get-wmiobject -class Win32_Printer -Property location,name,shareName,drivername
$allPrinterInfo.name
$allPrinterInfo.drivername

[xml]$5thFloorGPO = Get-GPOReport -ReportType xml -Name Printers_5th_Floor
$is5thFloorGPOEnabled = $5thFloorGPO.DocumentElement.Computer.Enabled
$is5thFloorGPOEnabled

[xml]$6thFloorGPO = Get-GPOReport -ReportType xml -Name Printers_6th_Floor
$is6thFloorGPOEnabled = $6thFloorGPO.DocumentElement.Computer.Enabled
$is6thFloorGPOEnabled

# Path to drive files can be found inside get-wmiobject -Class Win32_PrinterDriver