#!/bin/bash

# Install build tools
echo "Installing build tools..."
winget install --id Microsoft.VisualStudio.2022.BuildTools --source winget

# Install CMake
echo "Installing CMake..."
winget install --id Kitware.CMake --source winget

# Install GDB
echo "Installing GDB..."
winget install --id GNU.GDB --source winget

# Install Valgrind (Note: Valgrind is not natively supported on Windows, consider using WSL for Valgrind)
echo "Valgrind is not natively supported on Windows. Consider using WSL for Valgrind."

echo "C development environment setup complete!"

