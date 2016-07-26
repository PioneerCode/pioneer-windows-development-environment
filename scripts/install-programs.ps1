#################################################################################################
# Choco Install
#   Additonal packages can be found at https://chocolatey.org/packages
#   1) Remove/Add packages
#   2) Run Script
#################################################################################################

write-host "Installing Chocolatey . . ."
$ChocoInstallPath = "$($env:SystemDrive)\ProgramData\Chocolatey\bin"
if (!(Test-Path $ChocoInstallPath)) {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}
write-host "END Installing Chocolatey!"

chocolatey feature enable -n=allowGlobalConfirmation

write-host "Install ConEnmu . . . "
cinst -y  conemu 
write-host "END Install ConEnmu!"

write-host "Install WinRAR . . . "
cinst -y  winrar 
write-host "END Install WinRAR!"

write-host "Install 7zip . . . "
cinst -y  7zip 
write-host "END Install 7zip!"

write-host "Install Chrome . . . "
cinst -y  GoogleChrome  
write-host "END Install Chrome!"

write-host "Install Firefox . . . "
cinst -y  firefox 
write-host "END Install Firefox!"

write-host "Install GIT . . . "
cinst -y  git.install 
write-host "END Install GIT!"

write-host "Install posh-git"
cinst -y poshgit  
write-host "END posh-git!"

write-host "Install NodeJs . . . "
cinst -y nodejs.install 
write-host "END Install NodeJs!"

write-host "Install Redis . . . "
cinst -y  redis 
write-host "END Install Redis!"

write-host "Install Redis Desktop Manager . . . "
cinst -y  redis-desktop-manager 
write-host "END Install Redis Desktop Manager!"

write-host "Install Visual Studio Code . . . "
cinst -y  visualstudiocode 
write-host "END Install Visual Studio Code!"

write-host "Install Visual Studio 2015 Enterprise . . ."
cinst -y  visualstudio2015enterprise 
write-host "END Install Visual Studio 2015"

# write-host "Install Visual Studio 2015 Professional  . . ."
# cinst -y  visualstudio2015professional 
# write-host "END Install Visual Studio 2015 Professional"

# write-host "Install Visual Studio 2015 Community  . . ."
# cinst -y  visualstudio2015community 
# write-host "END Install Visual Studio 2015 Community"

write-host "Install ReSharper . . . "
cinst -y  resharper 
write-host "END Install ReSharper!"

# write-host "Install Web Api CMD . . . "
# choco install webpicommandline
# write-host "END Install Install Web Api CMD!"

# write-host "Install Url Rewrite and ARR . . ."
# $webPiProducts = @('UrlRewrite2', 'ARRv3_0') 
# WebPICMD /Install /Products:"$($webPiProducts -join ',')" /AcceptEULA
# write-host "END Install Url Rewrite and ARR . . ."

chocolatey feature disable -n=allowGlobalConfirmation