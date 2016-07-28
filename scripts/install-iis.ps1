#################################################################################################
# IIS Install
#   https://technet.microsoft.com/en-us/library/hh824822.aspx
#   1) Enable/Disable IIS ManagementConsole & Features
#   2) Enable/Disable IIS ASPNET 4.5 (which is actually 4.6)
#################################################################################################
Write-host "IIS Install started at: $((Get-Date).ToString())"

$iis = Get-Service W3SVC
if ($iis) 
{
    write-host "IIS Already Installed!"
    return;
} 

write-host "Installing IIS . . . "
dism /online /enable-feature /featurename:IIS-WebServerRole /featurename:IIS-WebServer /featurename:IIS-ManagementConsole /featurename:IIS-ApplicationDevelopment /featurename:IIS-ISAPIExtensions /featurename:IIS-ISAPIFilter /featurename:IIS-CommonHttpFeatures /featurename:IIS-DefaultDocument /featurename:IIS-DirectoryBrowsing /featurename:IIS-HttpErrors /featurename:IIS-StaticContent /featurename:IIS-HealthAndDiagnostics /featurename:IIS-HttpLogging /featurename:IIS-Performance /featurename:IIS-HttpCompressionDynamic /featurename:IIS-HttpCompressionStatic /featurename:IIS-Security /featurename:IIS-RequestFiltering | out-null
write-host "END Installing IIS!"

write-host "Enable ASP.NET 4.6 . . ."
dism /online /enable-feature /all /featurename:IIS-ASPNET45
write-host "END Installing IIS!"

Write-host "IIS Install ended at: $((Get-Date).ToString())"
