cls
# Create a txt file with the MK server names per line at the site
$Servers = ".\UninstallServerList.txt"

# The site name to put on the MKs
$Site = "Info"

# Name of the Feature to install
$FeatureName = "SNMP-Service"

$UserCredential = Get-Credential

Foreach ($Server in Get-Content $Servers) {

    Write-Host "Connecting to Server " $Server

    $Session = New-PSSession -ComputerName $Server -Credential $UserCredential
    Enter-PSSession $Session

    Invoke-Command -Session $Session -ArgumentList $Site, $FeatureName -ScriptBlock {
	
        param($Site, $FeatureName)
	    
        if (Uninstall-WindowsFeature -Name $FeatureName | where installed) {
           Write-Host "Uninstalling $FeatureName"
           Uninstall-WindowsFeature –Name $FeatureName -IncludeAllSubFeature
        } else {
           Write-Host "Feature is already uninstalled"
        }	
    }

    # Close your session when you are done
    Remove-PSSession $Session
}

Pause
