# Check if winget is available
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget is not installed. Please install the Windows Package Manager first."
    exit 1
}

# Install Node.js LTS
Write-Host "Installing Node.js LTS..." -ForegroundColor Green
winget install OpenJS.NodeJS.LTS

# Verify the installation
if ($LASTEXITCODE -eq 0) {
    Write-Host "Node.js LTS has been installed successfully!" -ForegroundColor Green
    
    # Inform user about PATH update
    Write-Host "Adding Node.js to PATH for current session..." -ForegroundColor Yellow
    
    # Refresh environment variables to update PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    # Check if Node.js is available in the current session
    if (Get-Command node -ErrorAction SilentlyContinue) {
        Write-Host "Node.js version: $(node -v)" -ForegroundColor Green
        Write-Host "npm version: $(npm -v)" -ForegroundColor Green
    } else {
        Write-Host "Node.js was installed but isn't available in the current PATH. You may need to restart your terminal." -ForegroundColor Yellow
        
        # Open PowerShell 7 to verify installation
        Write-Host "Opening PowerShell 7 to verify installation..." -ForegroundColor Yellow
        Start-Process pwsh -ArgumentList "-NoExit", "-Command", "Write-Host 'Node.js version: ' -NoNewline; node -v; Write-Host 'npm version: ' -NoNewline; npm -v"
    }
} else {
    Write-Error "There was an error installing Node.js LTS."
}
