# Infrastructure Setup Script for Windows

# Step 1: Check for Administrator Privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script must be run as an Administrator!" -ForegroundColor Red
    exit
}

# Step 2: Install Docker Desktop
Write-Host "Checking if Docker is installed..." -ForegroundColor Yellow
if (-Not (Get-Command "docker" -ErrorAction SilentlyContinue)) {
    Write-Host "Docker is not installed. Installing Docker Desktop..." -ForegroundColor Green
    Invoke-WebRequest -Uri https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe -OutFile DockerInstaller.exe
    Start-Process -FilePath DockerInstaller.exe -ArgumentList "/quiet" -Wait
    Write-Host "Docker Desktop installation completed. Restart your system if required." -ForegroundColor Green
} else {
    Write-Host "Docker is already installed." -ForegroundColor Green
}

# Step 3: Start Docker Desktop
Write-Host "Starting Docker Desktop..." -ForegroundColor Yellow
Start-Process "Docker Desktop" -NoNewWindow

# Wait for Docker to start
Start-Sleep -Seconds 30

# Step 4: Pull Nginx Docker Image
Write-Host "Pulling Nginx Docker image..." -ForegroundColor Yellow
docker pull nginx:latest

# Step 5: Run Nginx Container
Write-Host "Running the Nginx container on port 8090..." -ForegroundColor Yellow
docker run -d --name nginx-server -p 8090:80 nginx:latest

# Step 6: Configure Windows Firewall
Write-Host "Configuring firewall to allow traffic on port 8090..." -ForegroundColor Yellow
New-NetFirewallRule -DisplayName "Allow Port 8090" -Direction Inbound -LocalPort 8090 -Protocol TCP -Action Allow

Write-Host "Infrastructure setup completed successfully!" -ForegroundColor Green
Write-Host "You can access the Nginx server at http://localhost:8090 or http://<your_ip>:8090" -ForegroundColor Cyan
