$domain = (gwmi Win32_NTDomain).DomainName
$users = WMIC COMPUTERSYSTEM GET USERNAME
$computer = [System.Net.DNS]::GetHostByName('').HostName
write-output $computer $domain