#!/bin/bash

touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
sudo softwareupdate -i -a
sudo gem install bundler

if [ ! -e ~/.workstation ]
then
    git clone https://github.com/thomasmeeus/workstation.git ~/.workstation
fi

cd ~/.workstation
git pull
bundle install --path vendor/bundle
rm -rf ~/.workstation/vendor/cookbooks
bundle exec berks vendor vendor/cookbooks
bundle exec soloist
