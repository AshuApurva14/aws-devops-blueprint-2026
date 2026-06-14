#!/usr/bin/env bash

set -euo pipefail

    if command -v terraform &> /dev/null; then
        echo "Terraform is already installed: $(terraform -v)"
        exit 0
    fi
    
    echo "Terraform not found. Initializing Ubuntu repository installation..."
    
    # Ensure baseline package managers are refreshed
    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common wget
    
    # Download GPG key with embedded retry-safeguards to bypass 429 blocks
    wget -qO - --retry-on-http-error=429 --tries=5 --waitretry=5 https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    
    # Register the architectural repository list matching your Ubuntu codename
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    
    # Synchronize index files and pull down the terraform engine package
    sudo apt update && sudo apt install -y terraform