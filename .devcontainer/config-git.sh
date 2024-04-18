#!/bin/bash

# Change values here: 

# Set your values for name and email
GIT_NAME="INSERT_YOUR_NAME_HERE"
GIT_EMAIL="INSERT_YOUR_EMAIL_HERE"


# DO NOT CHANGE BELOW THIS LINE
# ------------------------------

# Check if the name variable is still the default, if not, set it
if [ "${GIT_NAME}" == "INSERT_YOUR_NAME_HERE" ]; then
    echo ""
    echo "Please provide your own name for version control with git"
    echo "To do so change the variable GIT_NAME in the file .devcontainer/config-git.sh"
    echo ""
else
    # Set Git configuration for name
    git config --global user.name "$GIT_NAME"
    echo "Setting git name to ${GIT_NAME}"
fi

# Check if the email variable is still the default, if not, set it
if [ "${GIT_EMAIL}" == "INSERT_YOUR_EMAIL_HERE" ]; then
    echo ""
    echo "Please provide your own email for version control with git"
    echo "To do so change the variable GIT_EMAIL in the file .devcontainer/config-git.sh"
    echo ""
else
    # Set Git configuration for name
    git config --global user.email "$GIT_EMAIL"
    echo "Setting git email to ${GIT_EMAIL}"
fi
