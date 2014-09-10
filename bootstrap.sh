#!/bin/bash

sudo -v

touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
sudo softwareupdate -i -a
sudo gem install bundler
sudo mkdir /opt
sudo chown $USER:staff /opt

if [ ! -e /opt/workstation ]
then
    git clone https://github.com/thomasmeeus/workstation.git /opt/workstation
fi

cd /opt/workstation
git pull
bundle install --path vendor/bundle
bundle exec berks vendor --path vendor/cookbooks
bundle exec soloist
