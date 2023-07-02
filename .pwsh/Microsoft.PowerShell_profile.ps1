# Add the oh-my-posh theme
oh-my-posh init pwsh | Invoke-Expression

# Imports module that adds file and folder icons
Import-Module -Name Terminal-Icons

# Add an alias to easily navigate to my WSL2 Ubuntu home/ directory
function GoUbuntuHome {
    Set-Location "\\wsl$\Ubuntu\home\kevanoullio"
}
