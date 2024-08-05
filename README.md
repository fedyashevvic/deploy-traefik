# Deployment Automation Scripts

This repository contains scripts to automate SSH key generation and application deployment on a VPS.

## Scripts

1. **generate_ssh_key.sh**: Generates an SSH key and prompts you to add it to GitHub.
2. **deploy_app.sh**: Installs Docker, clones the repository, and starts the application.

## Usage

```bash
git clone https://github.com/fedyashevvic/deploy-traefik.git projects_root
cd projects_root
chmod +x generate_ssh_key.sh
chmod +x deploy_app.sh

./generate_ssh_key.sh <your_email>
# HERE YOU NEED TO ADD THE GENERATED SSH KEY TO GITHUB
./deploy_app.sh <your_repository> <your_repository_name>
```