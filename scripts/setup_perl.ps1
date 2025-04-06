# Check if winget is available
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget is not installed. Please install the Windows Package Manager first."
    exit 1
}

# Install Strawberry Perl
Write-Host "Installing Strawberry Perl..." -ForegroundColor Green
winget install StrawberryPerl.StrawberryPerl

# Verify the installation
if ($LASTEXITCODE -eq 0) {
    Write-Host "Strawberry Perl has been installed successfully!" -ForegroundColor Green
    
    # Inform user about PATH update
    Write-Host "Adding Perl to PATH for current session..." -ForegroundColor Yellow
    
    # Refresh environment variables to update PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    # Check if Perl is available in the current session
    if (Get-Command perl -ErrorAction SilentlyContinue) {
        Write-Host "Perl version: $(perl -v | Select-String -Pattern 'This is perl.*')" -ForegroundColor Green
        Write-Host "Perl is ready to use!" -ForegroundColor Green
    } else {
        Write-Host "Perl was installed but isn't available in the current PATH. You may need to restart your terminal." -ForegroundColor Yellow
        
        # Open PowerShell 7 to verify installation
        Write-Host "Opening PowerShell 7 to verify installation..." -ForegroundColor Yellow
        Start-Process pwsh -ArgumentList "-NoExit", "-Command", "Write-Host 'Perl version: ' -NoNewline; perl -v | Select-String -Pattern 'This is perl.*'"
    }
    
    # Provide information about CPAN
    Write-Host "`nTo install Perl modules, you can use the CPAN tool:" -ForegroundColor Cyan
    Write-Host "  cpan Module::Name" -ForegroundColor Cyan
    
    # Provide basic usage example
    Write-Host "`nBasic Perl usage example:" -ForegroundColor Cyan
    Write-Host "  perl -e 'print \"Hello from Perl!\\n\";'" -ForegroundColor Cyan
} else {
    Write-Error "There was an error installing Strawberry Perl."
}
