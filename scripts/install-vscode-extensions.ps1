#################################################################################################
# VS Code Extensions
#   1) Remove/Add extenstions
#################################################################################################
Write-host "VS Code Extensions Started At: $((Get-Date).ToString())"

write-host "Install .editorconfig . . . "
code --install-extension EditorConfig.editorconfig
write-host "Install Code Spellchecker . . . "
code --install-extension streetsidesoftware.code-spell-checker

Write-host "S Code Extensions Ended At: $((Get-Date).ToString())"