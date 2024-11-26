# Automated Infrastructure Setup Script

This project automates the setup of an Nginx web server using Docker on Windows. The script checks for Docker installation, runs an Nginx container, configures networking, and sets up firewall rules.

## Features
- Automated installation of Docker Desktop (if not installed).
- Pulls the Nginx Docker image.
- Runs the Nginx container on a user-specified port.
- Configures Windows firewall to allow traffic on the specified port.

## Prerequisites
- **Windows 10/11** with **PowerShell**.
- **Administrator privileges** to run the script.
- Internet connection to download Docker and the Nginx image.

## Instructions

### 1. Clone the Repository
```powershell
git clone https://github.com/PRAVALIKA150/infrastructure-setup.git
git clone https://github.com/your username/infrastructure-setup.git
cd infrastructure-setup

### 2. Run the Script
Open PowerShell as Administrator and execute:

powershell
Copy code
.\setup_infrastructure.ps1
### 3. Access the Nginx Server
Open your browser and navigate to:
arduino
Copy code
http://localhost:8090
Or use the server's IP address:
arduino
Copy code
http://<your-ip-address>:8090

File Structure
setup_infrastructure.ps1: PowerShell script to automate the setup.
README.md: Instructions for using the script.
Troubleshooting
Docker Desktop Not Starting:
Ensure Docker Desktop is installed and running.
Port Conflict:
If the default port (8090) is in use, update the script with a different port number.
Firewall Issues:
Check that the firewall rule for the port is active:
powershell
Copy code
Get-NetFirewallRule | Where-Object DisplayName -eq "Allow Port 8090"
Manually add the rule if necessary.
