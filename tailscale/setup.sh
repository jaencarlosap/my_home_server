#!/bin/bash

curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --advertise-exit-node --advertise-routes=192.168.0.0/24


