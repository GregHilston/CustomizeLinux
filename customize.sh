#!/bin/bash

# Make sure only root can run our script (http://www.cyberciti.biz/tips/shell-root-user-check-script.html)
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!" 1>&2
   exit 1
fi

# Install the user selected packages
./install_packages.sh 

# Move the configs
./move_configs.sh