#!/bin/bash

# Install PowerShell 7
echo "Installing PowerShell 7..."
winget install --id Microsoft.Powershell --source winget

# Get the directory of the script
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Copy PowerShell profile
echo "Copying PowerShell profile..."
mkdir -p "$HOME/Documents/PowerShell"
PROFILE_PATH="$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"

if [ -f "$PROFILE_PATH" ]; then
    read -p "The file $PROFILE_PATH already exists. Do you want to overwrite it? (y/n): " choice
    case "$choice" in
        y|Y ) cp "$SCRIPT_DIR/../.pwsh/Microsoft.PowerShell_profile.ps1" "$PROFILE_PATH"; echo "File overwritten.";;
        n|N ) echo "File not overwritten.";;
        * ) echo "Invalid choice. File not overwritten.";;
    esac
else
    cp "$SCRIPT_DIR/../.pwsh/Microsoft.PowerShell_profile.ps1" "$PROFILE_PATH"
    echo "File copied."
fi

echo "Installation complete."

