#!/bin/bash

sudo -v

touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
sudo softwareupdate -i -a
sudo gem install bundler
sudo mkdir /opt
sudo chown $USER:staff /opt
git clone https://github.com/thomasmeeus/workstation.git /opt/workstation
cd /opt/workstation
bundle install --path vendor/bundle
bundle exec berks install --path vendor/cookbooks
bundle exec soloist
