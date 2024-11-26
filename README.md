# Automated Infrastructure Setup Script

# Infrastructure Setup Script for Windows

This repository contains a PowerShell script to automate the setup of a basic infrastructure environment, including a Dockerized Nginx server, networking configuration, and firewall rules.

---

## Features
- Automates the setup of a basic infrastructure using PowerShell.
- Installs Docker Desktop if it is not already installed.
- Deploys an Nginx container on the specified port (default: `8090`).
- Configures Windows Firewall to allow inbound traffic on the specified port.

---

## Prerequisites
To use this script, ensure you have:
1. A Windows operating system.
2. PowerShell 5.1 or later.
3. Administrator privileges to run the script.
4. An active internet connection for downloading Docker Desktop and Nginx.

---

## Setup Instructions

### Step 1: Clone the Repository
Run the following commands in PowerShell to clone the repository and navigate to the project directory:
```bash
git clone https://github.com/PRAVALIKA150/infrastructure-setup.git
cd infrastructure-setup

### 2. Run the Script### Step 2: Run the Script
1. Open PowerShell as **Administrator**.
2. Run the script using:
   ```bash
   .\setup_infrastructure.ps1

The script will:
Check if Docker Desktop is installed and install it if necessary.
Start Docker Desktop.
Pull the latest Nginx Docker image.
Deploy an Nginx container on port 8090.
Configure Windows Firewall to allow traffic on port 8090.
Step 3: Access the Nginx Server
After the script completes successfully:

Local Access: Open your browser and navigate to:
bash

http://localhost:8090
Remote Access: Use the server's IP address to access the server:
bash

http://<your-ip-address>:8090
File Structure
setup_infrastructure.ps1: The PowerShell script that automates the setup process.
README.md: Documentation on how to use the script.
Customizations
Change the Port Number
By default, the Nginx container is deployed on port 8090.
To use a different port, modify the $Port variable in the script:
powershell

$Port = 8081  # Example of using port 8081 instead of 8090
Use a Custom HTML Page
To serve a custom index.html file using Nginx:
Place your index.html file in a directory, e.g., C:\path\to\html.
Modify the Docker run command in the script to mount the file:
powershell

docker run -d --name nginx-server -p $Port:80 -v C:\path\to\html:/usr/share/nginx/html nginx:latest
Troubleshooting
Docker Desktop Issues
Docker is not starting: Ensure Docker Desktop is installed and running. The script automatically starts Docker Desktop if it is not running.
Restart Docker Desktop manually if the script fails.
Port Conflict
If port 8090 is already in use, modify the script to use a different port by changing the $Port variable:
powershell

$Port = 8081  # New port number
Firewall Issues
Verify the firewall rule is active using:
powershell

Get-NetFirewallRule | Where-Object DisplayName -eq "Allow Port 8090"
If the rule is missing, add it manually:
powershell

New-NetFirewallRule -DisplayName "Allow Port 8090" -Direction Inbound -LocalPort 8090 -Protocol TCP -Ac
