# Add the oh-my-posh theme
# oh-my-posh init pwsh | Invoke-Expression # NO THEME
# oh-my-posh init pwsh --config "C:\Users\kevan\AppData\Local\Programs\oh-my-posh\themes\emodipt-extend.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\kevan\AppData\Local\Programs\oh-my-posh\themes\kushal.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\kevan\AppData\Local\Programs\oh-my-posh\themes\quick-term.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "C:\Users\kevan\AppData\Local\Programs\oh-my-posh\themes\kevanoullio.omp.json" | Invoke-Expression

# Imports module that adds file and folder icons
Import-Module -Name Terminal-Icons

# Add an alias to easily navigate to my WSL2 Ubuntu home/ directory
function GoUbuntuHome {
    Set-Location "\\wsl$\Ubuntu\home\kevanoullio"
}
