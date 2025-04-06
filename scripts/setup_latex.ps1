# Check if winget is available
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget is not installed. Please install the Windows Package Manager first."
    exit 1
}

# Install MiKTeX (LaTeX distribution)
Write-Host "Installing MiKTeX (LaTeX distribution)..." -ForegroundColor Green
winget install MiKTeX.MiKTeX

# Verify the installation
if ($LASTEXITCODE -eq 0) {
    Write-Host "MiKTeX has been installed successfully!" -ForegroundColor Green
    
    # Inform user about PATH update
    Write-Host "Adding MiKTeX to PATH for current session..." -ForegroundColor Yellow
    
    # Refresh environment variables to update PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    # Check if MiKTeX is available in the current session
    if (Get-Command pdflatex -ErrorAction SilentlyContinue) {
        Write-Host "MiKTeX version: $(pdflatex --version | Select-Object -First 1)" -ForegroundColor Green
        Write-Host "LaTeX is ready to use!" -ForegroundColor Green
    } else {
        Write-Host "MiKTeX was installed but isn't available in the current PATH. You may need to restart your terminal." -ForegroundColor Yellow
        
        # Open PowerShell 7 to verify installation
        Write-Host "Opening PowerShell 7 to verify installation..." -ForegroundColor Yellow
        Start-Process pwsh -ArgumentList "-NoExit", "-Command", "Write-Host 'MiKTeX version: ' -NoNewline; pdflatex --version | Select-Object -First 1"
    }
    
        # Provide information about package management
    Write-Host "`nTo install additional LaTeX packages, use the MiKTeX Console application." -ForegroundColor Cyan
    Write-Host "You may need to run 'miktex-console' to set up your MiKTeX installation." -ForegroundColor Cyan
    Write-Host "`nNote: When you first run pdflatex, you might see a message:" -ForegroundColor Yellow
    Write-Host "  'pdflatex: major issue: So far, you have not checked for MiKTeX updates.'" -ForegroundColor Yellow
    Write-Host "This is normal for new installations. To resolve it:" -ForegroundColor Yellow
    Write-Host "  1. Run 'miktex-console'" -ForegroundColor Yellow
    Write-Host "  2. Go to 'Updates' and check for updates" -ForegroundColor Yellow
    Write-Host "  3. Install any available updates" -ForegroundColor Yellow
} else {
    Write-Error "There was an error installing MiKTeX."
}
