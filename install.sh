#!/bin/bash

echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing core dependencies..."
sudo apt install curl wget gnupg2 lsb-release software-properties-common apt-transport-https -y

echo "[+] Installing Samba..."
sudo apt install samba -y
sudo cp samba/smb.conf /etc/samba/smb.conf
sudo systemctl restart smbd

echo "[+] Installing Tailscale..."
bash tailscale/setup.sh

echo "[+] Installing Pi-hole..."
bash pihole/setup.sh

echo "[+] Installing Webmin..."
# Add Webmin repository
echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee /etc/apt/sources.list.d/webmin.list

# Add GPG key
wget -qO - http://www.webmin.com/jcameron-key.asc | sudo apt-key add -

# Update and install Webmin
sudo apt update
sudo apt install webmin -y

# Optional: open Webmin port
sudo ufw allow 10000/tcp

echo "[✓] Setup complete! Access Webmin at https://<your-ip>:10000"

