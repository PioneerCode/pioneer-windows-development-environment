#################################################################################################
# IIS Install
#   https://technet.microsoft.com/en-us/library/hh824822.aspx
#   1) Enable IIS ManagementConsole & Features
#   2) Enable IIS ASPNET 4.5 (which is actually 4.6)
#################################################################################################
write-host "Running IIS Script . . ."

write-host "Installing IIS . . ."
dism /online /enable-feature /featurename:IIS-WebServerRole /featurename:IIS-WebServer /featurename:IIS-ManagementConsole /featurename:IIS-ApplicationDevelopment /featurename:IIS-ISAPIExtensions /featurename:IIS-ISAPIFilter /featurename:IIS-CommonHttpFeatures /featurename:IIS-DefaultDocument /featurename:IIS-DirectoryBrowsing /featurename:IIS-HttpErrors /featurename:IIS-StaticContent /featurename:IIS-HealthAndDiagnostics /featurename:IIS-HttpLogging /featurename:IIS-Performance /featurename:IIS-HttpCompressionDynamic /featurename:IIS-HttpCompressionStatic /featurename:IIS-Security /featurename:IIS-RequestFiltering 
write-host "END Installing IIS!"

write-host "Install Url Rewrite and ARR . . ."
$webPiProducts = @('UrlRewrite2', 'ARRv3_0') 
WebPICMD /Install /Products:"$($webPiProducts -join ',')" /AcceptEULA
write-host "END Install Url Rewrite and ARR . . ."

write-host "END Running IIS Script"