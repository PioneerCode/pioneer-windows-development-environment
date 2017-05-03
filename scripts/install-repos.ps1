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
Set-Location $projectDir

write-host "END Creating source directory!"

write-host "Pulling Pioneer Code . . ."

git clone "https://github.com/PioneerCode/pioneer-blog.git"
git clone "https://github.com/PioneerCode/pioneer-warmer.git"
git clone "https://github.com/PioneerCode/pioneer-console-boilerplate.git"
git clone "https://github.com/PioneerCode/pioneer-pagination.git"
git clone "https://github.com/pioneer-windows-development-environment.git"

write-host "END Pulling Pioneer Code"

Read-Host -Prompt "Press Enter to exit"