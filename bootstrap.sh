#!/bin/bash

function sudo_ping() {
    if [[ ! -z $SUDO_PID ]]; then
        if [[ $1 -eq stop ]]; then
            kill $SUDO_PID
            return
        else
            return
        fi
    fi

    sudo -v
    if [[ $? -eq 1 ]]; then
        echo "Oops, wrong password."
        return
    fi

    while true; do
        sudo -v
        sleep 1
    done &
    SUDO_PID=$!

    # Make sure we don't orphan our pinger
    trap "sudo_ping stop" 0
    trap "exit 2" 1 2 3 15
}


sudo_ping
sleep 5

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
