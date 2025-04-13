# Check if winget is available
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget is not installed. Please install the Windows Package Manager first."
    exit 1
}

# Install lazygit
Write-Host "Installing lazygit..." -ForegroundColor Green
winget install --id=JesseDuffield.lazygit -e

# Verify the installation
if ($LASTEXITCODE -eq 0) {
    Write-Host "lazygit has been installed successfully!" -ForegroundColor Green
    
    # Inform user about PATH update
    Write-Host "Adding lazygit to PATH for current session (if required)..." -ForegroundColor Yellow
    
    # Refresh environment variables to update PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    # Check if lazygit is available in the current session
    if (Get-Command lazygit -ErrorAction SilentlyContinue) {
        Write-Host "lazygit version: $(lazygit --version)" -ForegroundColor Green
        Write-Host "lazygit is ready to use!" -ForegroundColor Green
    } else {
        Write-Host "lazygit was installed but isn't available in the current PATH. You may need to restart your terminal." -ForegroundColor Yellow
        
        # Open PowerShell 7 to verify installation
        Write-Host "Opening PowerShell 7 to verify installation..." -ForegroundColor Yellow
        Start-Process pwsh -ArgumentList "-NoExit", "-Command", "Write-Host 'lazygit version: ' -NoNewline; lazygit --version"
    }
} else {
    Write-Error "There was an error installing lazygit."
}
