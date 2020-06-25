#+------------------------------------------------------------+
# | Module Name:        Windows 10 Remove Apps                 |
# | Module Purpose:     Remove Windows 10 Bloatware            |
# | Module Modifier:    John Marcellus                         |
# | Module Date:        4/03/2018                              |
# +------------------------------------------------------------
Get-AppxPackage *3dbuilder* | Remove-AppxPackage
Get-AppxPackage *advertising* | Remove-AppxPackage
Get-AppxPackage *bing* | Remove-AppxPackage
Get-AppxPackage *candy* | Remove-AppxPackage
Get-appxpackage *commsphone* | remove-appxpackage
Get-appxpackage *communicationsapps* | remove-appxpackage
Get-AppxPackage *feedback* | Remove-AppxPackage
Get-AppxPackage *getstarted* | Remove-AppxPackage
Get-AppxPackage *kindle* | Remove-AppxPackage
Get-AppxPackage *messaging* | Remove-AppxPackage
Get–AppxPackage *msn* | Remove–AppxPackage
Get-AppxPackage *news* | Remove-AppxPackage
Get-AppxPackage *news* | Remove-AppxPackage
Get-AppxPackage *people* | Remove-AppxPackage
Get-AppxPackage *photos* | Remove-AppxPackage
Get-AppxPackage *officehub* | Remove-AppxPackage
Get-AppxPackage *reader* | Remove-AppxPackage
Get-AppxPackage *solitairecollection* | Remove-AppxPackage
Get-AppxPackage *soundrecorder* | Remove-AppxPackage
Get-AppxPackage *skypeapp* | Remove-AppxPackage
Get-AppxPackage *store* | Remove-AppxPackage
Get-AppxPackage *sway* | Remove-AppxPackage
Get–AppxPackage *twitter* | Remove–AppxPackage
Get–AppxPackage *facebook* | Remove–AppxPackage
Get-AppxPackage *zunemusic* | Remove-AppxPackage
Get-appxpackage *zune* | remove-appxpackage
Get-appxpackage *onenote* | remove-appxpackage
Get-AppxPackage *windowsalarms* | Remove-AppxPackage
Get-AppxPackage *windowscalculator* | Remove-AppxPackage
Get-AppxPackage *windowscamera* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage *windowsmaps* | Remove-AppxPackage
Get-appxpackage *windowsphone* | remove-appxpackage
Get-AppxPackage *windowsstore* | Remove-AppxPackage
Get-AppxPackage *xboxapp* | Remove-AppxPackage
Get-AppxPackage -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -online | Remove-AppxProvisionedPackage -online
Get-AppxPackage | Select Name, PackageFullName Remove-AppxPackage Microsoft.Windows.Cortana_1.4.8.176_neutral_neutral_cw5n1h2txyewy
