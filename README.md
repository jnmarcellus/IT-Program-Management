# ITOpsProgramStuff

Do you want to be an IT Operations Leader but don't want to spend 10 days working on a powerpoint, well you have found the right repository!

### Getting Started

Look for what you want and use it :)

## Prerequisites for Ansible Library

Download and run

## Prerequisites for Powershell Library

Open Run Command/Console ( Win + R )
Type: gpedit.msc (Group Policy Editor)
Browse to Local Computer Policy -> Computer Configuration -> Administrative Templates -> Windows Components -> Windows Powershell.
Enable "Turn on Script Execution"
Set the policy as needed. I set mine to "Allow all scripts".

## Powershell Execution

Enable execution of PowerShell scripts:

1. PS> Set-ExecutionPolicy Unrestricted
Unblock PowerShell scripts and modules within this directory:

1. PS > ls -Recurse *.ps1 | Unblock-File
2. PS > ls -Recurse *.psm1 | Unblock-File

## Usage

1. Install all available updates for your system.
2. Edit the scripts to fit your need.
3. Run the scripts from a PowerShell with administrator priviledges (Explorer Files > Open Windows PowerShell > Open Windows PowerShell as administrator)
4. PS > Restart-Computer
5. Run disable-windows-defender.ps1 one more time.
6. PS > Restart-Computer

### Liability

All scripts are provided as is and you use them at your own risk.

### Contribute
I would be happy to extend the collection of scripts. Just open an issue or send me a pull request.

### Authors

John Marcellus - Initial Work, Program Management, and Powershell Libraries
Randy Muma - Ansible
