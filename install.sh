# installation of jenkins in server in ubuntu os
#!/bin/bash
sudo apt update
#!/bin/bash

# Update package lists
sudo apt update

# Install Java (required for Jenkins)
sudo apt install -y openjdk-11-jdk

# Add Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc >/dev/null

# Add Jenkins repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list >/dev/null

# Update package lists again
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Install required packages for Terraform
sudo apt install -y software-properties-common gnupg2 curl

# Add HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add HashiCorp repository
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Update package lists
sudo apt update

# Install Terraform
sudo apt install -y terraform

# Verify installations
java -version
jenkins --version
terraform --version
