#+------------------------------------------------------------+
# | Module Name:        Update SNMP                            |
# | Module Purpose:     Install and Update Server SNMP Settings|
# | Module Modifier:    John Marcellus                         |
# | Module Date:        5/29/2020                              |
# +------------------------------------------------------------
cls
# Create a txt file with the MK server names per line at the site
$Servers = ".\ServerList.txt"

# The site name to put on the MKs
$Site = "PUTADDRESSHERE"

# Name of the Feature to install
$FeatureName = "SNMP-Service"

$UserCredential = Get-Credential

Foreach ($Server in Get-Content $Servers) {

    Write-Host "Connecting to Server " $Server

    $Session = New-PSSession -ComputerName $Server -Credential $UserCredential
    Enter-PSSession $Session

    Invoke-Command -Session $Session -ArgumentList $Site, $FeatureName -ScriptBlock {
	
        param($Site, $FeatureName)
	    
        if (Get-WindowsFeature -Name $FeatureName | where installed) {
           Write-Host "Feature is already installed"
        } else {
           Write-Host "Installing $FeatureName"
           Install-WindowsFeature –Name $FeatureName -IncludeAllSubFeature
        }	
		New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\SNMP\Parameters\ValidCommunities" -Name "PUTSNMPSTRINGHERE" -Value "4" -PropertyType DWORD
	    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\SNMP\Parameters\PermittedManagers" -Name 2 -Value "PUTSNMPPOLLERSERVERHERE"
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\SNMP\Parameters\RFC1156Agent" -Name "sysLocation" -Value $Site
    }

    # Close your session when you are done
    Remove-PSSession $Session
}

Pause
