#+------------------------------------------------------------+
# | Module Name:        Defender Uninstall                     |
# | Module Purpose:     Remove Windows Defender (Win 10/2016)  |
# | Module Modifier:    John Marcellus                         |
# | Module Date:        4/03/2018                              |
# +------------------------------------------------------------
#This Requires RSAT Tools being Installed on the Host Machine
#The Link to the Toolset: https://www.microsoft.com/en-au/download/confirmation.aspx?id=45520
#If you want to see what modules are loaded use the following command:get-module -list
import-module servermanager
Uninstall-WindowsFeature -Name Windows-Defender
