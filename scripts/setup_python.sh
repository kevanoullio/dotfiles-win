#!/bin/bash

# Update package list and install prerequisites
sudo apt update
sudo apt install -y wget

# Install Miniconda (if not already installed)
if [ ! -d "$HOME/miniconda3" ]; then
    echo "Installing Miniconda..."
    winget install --id Anaconda.Miniconda3 --source winget
else
    echo "Miniconda is already installed."
fi

# Add Miniconda to PATH
export PATH="$HOME/miniconda3/Scripts:$HOME/miniconda3/condabin:$PATH"

# Initialize Conda
echo "Initializing Conda..."
conda init

# Set up the base Conda environment with Python 3.11.4
echo "Setting up the base Conda environment with Python 3.11.4..."
conda install python=3.11.4 -y

# Install common Python packages
echo "Installing common Python packages..."
conda install -y numpy pandas matplotlib

echo "Python environment setup complete!"

