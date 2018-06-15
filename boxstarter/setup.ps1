#------------------
# Windows Settings
#------------------

Disable-BingSearch
Disable-GameBarTips

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions
Set-TaskbarOptions -Size Small -Dock Bottom -Combine Always -Lock

#----------------
# Choco Installs
#----------------

cinst -y Microsoft-Hyper-V-All -source windowsFeatures
cinst -y winrar
cinst -y 7zip
cinst -y GoogleChrome 
cinst -y firefox
cinst -y git.install
cinst -y nodejs.install
cinst -y ccleaner
cinst -y visualstudio2017enterprise
cinst -y resharper

cinst -y visualstudiocode
cinst -y vscode-tslint
cinst -y vscode-powershell
cinst -y vscode-editorconfig
cinst -y vscode-gitignore
cinst -y vscode-editorconfig

cinst -y dotnetcore-sdk

#----------------
# VSCode ext
#----------------
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.michelemelluso.code-beautifier
code --install-extension streetsidesoftware.michelemelluso.donjayamanne.githistor
code --install-extension ms-vsliveshare.vsliveshare

#---------------
# VS workloads
#---------------

# Set-Location "C:\Windows.old\Users\vagrant\AppData\Local\Temp\chocolatey\visualstudio2017enterprise\15.7.3.0"
# .\vs_enterprise.exe update --add Microsoft.VisualStudio.Workload.CoreEditor --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Microsoft.VisualStudio.Workload.NetWeb  --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.Data --installPath "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise"


#-----------------------
# Privacy Settings
#-----------------------

# Privacy: Let apps use my advertising ID: Disable
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0
# To Restore:
#Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 1
# Privacy: SmartScreen Filter for Store Apps: Disable
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost -Name EnableWebContentEvaluation -Type DWord -Value 0
# To Restore:
#Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost -Name EnableWebContentEvaluation -Type DWord -Value 1

# WiFi Sense: HotSpot Sharing: Disable
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Name value -Type DWord -Value 0
# WiFi Sense: Shared HotSpot Auto-Connect: Disable
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots -Name value -Type DWord -Value 0

# Start Menu: Disable Bing Search Results
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 0
# To Restore (Enabled):
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 1

# Start Menu: Disale Cortana (Commented out by default - this is personal preference)
# TODO: Figure this out - need another VM to test, mine's already disabled via domain, etc.

# Disable Telemetry (requires a reboot to take effect)
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
Get-Service DiagTrack, Dmwappushservice | Stop-Service | Set-Service -StartupType Disabled

#-------------
# Remove apps
#-------------

Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage king.com.CandyCrushSaga | Remove-AppxPackage
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsPhone | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage
Get-AppxPackage Microsoft.People | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage
Get-AppxPackage Microsoft.Windows.Photos | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage
Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage
Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage

#------------------------------- 
# Updates
#-------------------------------
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
