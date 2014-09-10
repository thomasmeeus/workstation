#!/bin/bash

sudo -v
sudo softwareupdate -i -a
sudo gem install bundler
sudo bundle install

cat > soloistrc <<EOF
cookbook_paths:
- $PWD/vendor/cookbooks
recipes:
- workstation::default
EOF

bundle exec berks install --path vendor/cookbooks
bundle exec soloist
