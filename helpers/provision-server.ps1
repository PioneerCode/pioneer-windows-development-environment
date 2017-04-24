########################################################################################################
# Base installs for Pioneer server
#   1) Install Chocolatey 
#   2) Install Chocolatey packages - Additonal packages can be found at https://chocolatey.org/package
#   
########################################################################################################

# Choco Install
Write-host "Choco Started At: $((Get-Date).ToString())"

$ChocoInstallPath = "$($env:SystemDrive)\ProgramData\Chocolatey\bin"
if (!(Test-Path $ChocoInstallPath)) {
    write-host "Install Chocolatey . . . "
    Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) | out-null
    write-host "END Installing Chocolatey!" 
} else {
    write-host "Upgrade Chocolatey . . . "
    choco upgrade chocolatey
    write-host "END Upgrade Chocolatey!"
}

chocolatey feature enable -n=allowGlobalConfirmation

# Utilites
write-host "Install WinRAR . . . "
cinst -y  winrar | Out-Null
write-host "END Install WinRAR!"

write-host "Install Dropbox . . . "
cinst -y  dropbox | Out-Null
write-host "END Install Dropbox!"

# CI
write-host "Install Octopus Deploy . . . "
cinst -y  octopusdeploy  | Out-Null
write-host "END Install Octopus Deploy!"

write-host "Install Octopus Deploy Tentacle . . . "
cinst -y  octopusdeploy.tentacle | Out-Null
write-host "END Install Octopus Deploy Tentacle!"

write-host "Install TeamCity . . . "
cinst -y  teamcity | Out-Null
write-host "END Install TeamCity!"

write-host "Install NodeJs . . . "
cinst -y nodejs.install | Out-Null
write-host "END Install NodeJs!"

# Fun
write-host "Install Plex Media Server . . . "
cinst -y  plexmediaserver | Out-Null
write-host "END Install Plex Media Server!"

# Database
write-host "Install SQL Managment Studio . . . "
cinst -y  sql-server-management-studio | Out-Null
write-host "END Install SQL Managment Studio!"

chocolatey feature disable -n=allowGlobalConfirmation

Write-host "Choco Ended At: $((Get-Date).ToString())"
