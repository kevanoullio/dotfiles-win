#!/bin/bash

# Get the directory of the script
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Run individual setup scripts
# bash $SCRIPT_DIR/setup_common.sh
bash $SCRIPT_DIR/setup_pwsh.sh
bash $SCRIPT_DIR/setup_ohmyposh.sh
bash $SCRIPT_DIR/setup_git.sh
bash $SCRIPT_DIR/setup_c.sh
bash $SCRIPT_DIR/setup_python.sh

echo "All setups complete!"

