#!/bin/sh

# Source: https://github.com/Aypak/shiny_server_rpi4/blob/master/Stable_RPiShinyServer.sh

# Start at home directory
cd ~ || return

# Update/Upgrade Raspberry Pi
sudo apt-get -y update && sudo apt-get -y upgrade

# Install R
sudo apt-get -y install r-base
sudo apt install r-base-core


# Install cmake: https://github.com/rstudio/shiny-server/wiki/Building-Shiny-Server-from-Source#what-if-a-sufficiently-recent-version-of-cmake-isnt-available
sudo apt-get -y install libssl-dev libcurl4-openssl-dev cmake

# Install R Packages
sudo apt install r-cran-httpuv r-cran-shiny r-cran-rmarkdown

# Install Shiny Server as per https://github.com/rstudio/shiny-server/issues/347
## Clone the Shiny Server repository from GitHub
git clone https://github.com/rstudio/shiny-server.git

## Copy the custom install-node.sh into the shiny-server file. This makes sure the right node version
## is downloaded from npm for ARM processors.
cp ~/dev-setup/rpi/stable_support_files/install-node.sh ~/shiny-server/external/node/install-node.sh 

## Build Shiny Server
~/shiny-server/packaging/make-package.sh

## Copy Shiny Server directory to system location
sudo cp -r ~/shiny-server/ /usr/local/

# Place a shortcut to the shiny-server executable in /usr/bin
sudo ln -s /usr/local/shiny-server/bin/shiny-server /usr/bin/shiny-server

#Create shiny user. On some systems, you may need to specify the full path to 'useradd'
sudo useradd -r -m shiny

# Create log, config, and application directories
sudo mkdir -p /var/log/shiny-server
sudo mkdir -p /srv/shiny-server
sudo mkdir -p /var/lib/shiny-server
sudo chown shiny /var/log/shiny-server
sudo mkdir -p /etc/shiny-server

# Return to Shiny Server directory and set shiny-server.conf
cd ~/shiny-server || return
sudo cp config/default.config /etc/shiny-server/shiny-server.conf
sudo cp -r /usr/local/shiny-server/ext/pandoc .
sudo rm -r /usr/local/shiny-server/ext/pandoc/
# Setup for start at boot: http://docs.rstudio.com/shiny-server/#systemd-redhat-7-ubuntu-15.04-sles-12
# and: https://www.raspberrypi-spy.co.uk/2015/10/how-to-autorun-a-python-script-on-boot-using-systemd/
sed -i -e "s:ExecStart=/usr/bin/env bash -c 'exec /opt/shiny-server/bin/shiny-server >> /var/log/shiny-server.log 2>&1':ExecStart=/usr/bin/shiny-server:g"  config/systemd/shiny-server.service
sed -i -e 's:/env::'  config/systemd/shiny-server.service
sudo cp config/systemd/shiny-server.service /lib/systemd/system/
sudo chmod 644 /lib/systemd/system/shiny-server.service
sudo systemctl daemon-reload
sudo systemctl enable shiny-server.service

# Final Shiny Server Setup
sudo cp samples/welcome.html /srv/shiny-server/index.html
sudo cp -r samples/sample-apps/ /srv/shiny-server/

# Restart the shiny service
cd  || return & sudo service shiny-server restart
