#+------------------------------------------------------------+
# | Module Name:        Client Cleanup                         |
# | Module Purpose:     Remove old versions of Office Products |
# | Module Modifier:    John Marcellus                         |
# | Module Date:        8/31/2017                              |
# +------------------------------------------------------------
wmic product where "name like 'Microsoft Office XP Professional'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Office Professional Hybrid 2007'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Office 2003 Professional'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Office 2003'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Office 2007'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Office Professional Hybrid 2007'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Office 2010 Professional'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Office Standard 2010'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Office 2010 Professional Plus 2010'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Single Image 2010'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Office 2010'" call uninstall /nointeractive
wmic product where "name like 'Microsoft Office Professional Plus 2013'" call uninstall /nointeractive
