#!/bin/bash

echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing dependencies..."
sudo apt install curl wget gnupg2 lsb-release software-properties-common -y

echo "[+] Installing Samba..."
sudo apt install samba -y
sudo cp samba/smb.conf /etc/samba/smb.conf
sudo systemctl restart smbd

echo "[+] Installing Tailscale..."
bash tailscale/setup.sh

echo "[+] Installing Pi-hole..."
bash pihole/setup.sh

echo "[✓] Setup complete!"

