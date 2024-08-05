#!/bin/bash

# Usage: ./deploy_app.sh <github_repo_url> <project_name>
# Example: ./deploy_app.sh git@github.com:yourusername/yourrepository.git yourrepository

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <github_repo_url> <project_name>"
    exit 1
fi

GITHUB_REPO_URL=$1
PROJECT_NAME=$2

# Ensure Docker and Docker Compose are installed
echo "Installing Docker and Docker Compose..."
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '\"tag_name\": \"\K.*\d')" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clone the GitHub repository
echo "Cloning the repository..."
git clone $GITHUB_REPO_URL $PROJECT_NAME
cd $PROJECT_NAME

# Start Docker Compose
echo "Starting Docker Compose..."
sudo docker-compose up -d

echo "Deployment completed for environment: $ENVIRONMENT"
