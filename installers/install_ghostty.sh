#!/bin/bash

cd /tmp

# Download and install Ghostty
wget https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.0.1-0-ppa1/ghostty_1.0.1-0.ppa1_amd64_22.04.deb
sudo dpkg -i ghostty_1.0.1-0.ppa1_amd64_22.04.deb
