# PRINTER RESET
#
# This script will reset a computer's printer list, after manual printer removal 
# has failed due to a jammed print spooler or broken driver file.
# 
# The script will stop the print spooler, manually delete print driver files on the C: drive, 
# removes the registry entries for the cleared printers, then reboots to readd the printers
# via group policy.
#


 