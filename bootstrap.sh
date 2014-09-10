#!/bin/bash

sudo -v
sudo softwareupdate -i -a
sudo gem install bundler
git clone https://github.com/thomasmeeus/workstation.git /opt
cd /opt
sudo bundle install
bundle exec berks install --path vendor/cookbooks
bundle exec soloist
