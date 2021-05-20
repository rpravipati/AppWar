# Show the current WinRM listeners installed
$ winrm enumerate winrm/config/listener

# Show the current WinRM auth types available
$ winrm get winrm/config/Service

# Download ConfigureRemotingForAnsible.ps1 Powershell script from Ansible Github repo
$ wget https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -OutFile ConfigureRemotingForAnsible.ps1

# Use Powershell script to configure WinRM listeners and auth for https and CredSSP
$ .\ConfigureRemotingForAnsible.ps1 -EnableCredSSP -DisableBasicAuth -Verbose

# Remove http listner
$ Get-ChildItem -Path WSMan:\localhost\Listener | Where-Object { $_.Keys -eq "Transport=HTTP" } | Remove-Item -Recurse -Force

# Restart WinRM service
$ Restart-Service WinRM

##
# Demo 06 Create /etc/ansible folder and write out basic /etc/ansible/hosts file for testing (refer to accompanied hosts source file)
##

# Create default folder for Ansible inventory
$ sudo mkdir /etc/ansible

# Open /etc/ansible/hosts file for editing with nano (refer to included hosts file for source)
$ sudo nano /etc/ansible/hosts

# Test hosts file and full configuration with win_ping
$ ansible web -m win_ping
