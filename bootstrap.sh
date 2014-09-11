#!/bin/bash

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






function sudo_ping() {
    if [[ ! -z $SUDO_PID ]]; then
        if [[ $1 -eq stop ]]; then
            echo "Stopping sudo ping in PID = $SUDO_PID"
            kill $SUDO_PID
            return
        else
            echo "Already sudo pinging in PID = $SUDO_PID"
            return
        fi
    fi

    echo "Starting background sudo ping..."
    sudo -v
    if [[ $? -eq 1 ]]; then
        echo "Oops, wrong password."
        return
    fi
    sudo echo "ok"

    while true; do
        echo 'Sudo ping!'
        sudo -v
        sleep 1
    done &
    SUDO_PID=$!
    sudo echo "Sudo pinging in PID = $SUDO_PID"

    # Make sure we don't orphan our pinger
    trap "sudo_ping stop" 0
    trap "exit 2" 1 2 3 15
}
