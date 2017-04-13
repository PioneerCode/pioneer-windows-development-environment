########################################################################################################
# Setup your host machine with proper toolilng to start creating Vagrant VM's
#   1) Install Chocolatey 
#   2) Install Chocolatey packages - Additonal packages can be found at https://chocolatey.org/package
#   3) Install base repo for Vagrant
#   
#   Consider creating a box-starter script
########################################################################################################

# Enviroment Setup
Write-host "Enviroment Started At: $((Get-Date).ToString())"

$projectDir = "${env:systemdrive}\source"
If (!(Test-Path $projectDir)) {
	New-Item -Path $projectDir -ItemType Directory
}

Set-Location $projectDir

Write-host "Enviroment Ended At: $((Get-Date).ToString())"

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

write-host "Install WinRAR . . . "
cinst -y  winrar | Out-Null
write-host "END Install WinRAR!"

write-host "Install Chrome . . . "
cinst -y  GoogleChrome  | Out-Null
write-host "END Install Chrome!"

write-host "Install CCleaaner . . . "
cinst -y  ccleaner | Out-Null
write-host "END Install CCleaner!"

write-host "Install Dropbox . . . "
cinst -y  dropbox | Out-Null
write-host "END Install Dropbox!"

write-host "Install UTorrent . . . "
cinst -y  utorrent | Out-Null
write-host "END Install UTorrent!"

write-host "Install GIT . . . "
cinst -y  git.install | Out-Null
write-host "END Install GIT!"

write-host "Install Visual Studio Code . . . "
cinst -y  visualstudiocode | Out-Null
write-host "END Install Visual Studio Code!"

write-host "Install VirtualBox . . . "
cinst -y  virtualbox | Out-Null
write-host "END Install VirtualBox!"

write-host "Install Vagrant . . . "
cinst -y  vagrant | Out-Null
write-host "END Install Vagrant!"

chocolatey feature disable -n=allowGlobalConfirmation

Write-host "Choco Ended At: $((Get-Date).ToString())"

# Repo install
Write-host "Repo Started At: $((Get-Date).ToString())"

$projectDir = "$($projectDir)\pioneer"
If (!(Test-Path $projectDir)) {
	New-Item -Path $projectDir -ItemType Directory
}
Set-Location $projectDir
git clone "https://github.com/PioneerCode/pioneer-windows-development-environment.git"

Write-host "Repo Ended At: $((Get-Date).ToString())"
