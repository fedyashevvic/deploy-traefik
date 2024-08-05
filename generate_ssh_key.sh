#!/bin/bash

# Usage: ./generate_ssh_key.sh <your_email>
# Example: ./generate_ssh_key.sh your_email@example.com

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <your_email>"
    exit 1
fi

EMAIL=$1

# Check if SSH key already exists
if [ -f ~/.ssh/id_rsa ]; then
    echo "SSH key already exists."
    cat ~/.ssh/id_rsa.pub
    echo "Visit https://github.com/settings/keys to add your SSH key."
else
    # Generate SSH key
    echo "Generating SSH key..."
    ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f ~/.ssh/id_rsa -N ""

    # Add SSH key to the ssh-agent
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa

    # Print the public key and prompt to add to GitHub
    echo "SSH key generated. Please add the following public key to your GitHub account:"
    cat ~/.ssh/id_rsa.pub
    echo "Visit https://github.com/settings/keys to add your SSH key."
fi
