#################################################################################################
# npm Install
#   Additonal packages can be found at https://www.npmjs.com/
#   1) Remove/Add packages
#################################################################################################
Write-host "npm Started At: $((Get-Date).ToString())"

write-host "Install Gulp . . ."
npm rm --global gulp
npm install gulp-cli -g
write-host "END Install Gulp!"

write-host "Install Bower . . ."
npm install bower -g
write-host "END Install Bower!"

write-host "Install DefinitelyTyped . . ."
npm install typings -g
write-host "END Install DefinitelyTyped!"

Write-host "npm Ended At: $((Get-Date).ToString())"
