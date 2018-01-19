#################################################################################################
# ML Env
#   Additonal packages can be found at https://chocolatey.org/packages
#   1) Remove/Add packages
#################################################################################################
Write-host "ML Env At: $((Get-Date).ToString())"

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

write-host "Install ConEnmu . . . "
cinst -y  visualstudiocode | Out-Null
write-host "END Install ConEnmu!"

write-host "Install ConEnmu . . . "
cinst -y  python | Out-Null
write-host "END Install ConEnmu!"

write-host "Install WinRAR . . . "
cinst -y  pip | Out-Null
write-host "END Install WinRAR!"

# Needed for tensorflow
write-host "Install vcredist140  . . . "
cinst -y  vcredist140  | Out-Null
write-host "END Install vcredist140 !"

chocolatey feature disable -n=allowGlobalConfirmation

write-host "Install VirtualEnvironmentWrapper . . . "
pip install virtualenvwrapper-win
mkvirtualenv tensorflow
workon tensorflow
write-host "END Install VirtualEnvironmentWrapper!"

write-host "Install jupyter . . . "
pip install --upgrade pip
pip install jupyter
write-host "Install jupyter . . . "

write-host "Install pip packagtes . . . "
pip install numpy
pip install --upgrade tensorflow
pip install matplotlib 
pip install pillow
write-host "Install pip packagtes . . . "

Write-host "ML Env At: $((Get-Date).ToString())"