#################################################################################################
# Pioneer Code Repository Install
#################################################################################################

write-host "-------------"
write-host " Pioneer Code"
write-host "-------------"

write-host "Creating source directory . . ."

$projectDir = "${env:systemdrive}\source"
If (!(Test-Path $projectDir)) {
	New-Item -Path $projectDir -ItemType Directory
}
cd $projectDir

write-host "END Creating source directory!"

write-host "Pulling Pioneer Code . . ."

git clone "https://github.com/PioneerCode/pioneer-windows-development-environment.git"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-cite-web"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-core"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-data-importer"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-docs"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-etl"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-file-content"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-filewatcher"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-lpr-vps"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-search-engine"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-transportation-tour-mobile"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-utility-ftp-file-copy"
git clone "http://$($username):$($password)@tfs.tbdsite.com/tfs/SDE/_git/sde-web"

write-host "END Pulling Pioneer Code"

Read-Host -Prompt "Press Enter to exit"