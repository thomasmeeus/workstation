#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'chown /usr/local/bin' do
    command "sudo chown -R #{node['current_user']}:staff /usr/local"
end
homebrew_tap 'homebrew/dupes'
homebrew_tap 'caskroom/cask'

%w{
    git
    git-extras
    pwgen
    siege
    bash
    coreutils
    automake
    autoconf
    dos2unix
    findutils
    gawk
    gettext
    gnu-sed
    gnu-tar
    htop-osx
    iftop
    libtool
    libyaml
    mutt
    mysql
    nmap
    openssl
    pv
    siege
    readline
    smartmontools
    watch
    wget
    xmlstarlet
    php55
    composer
    brew-cask
}.each do |package|
    package package do
        action :install
    end
end

%w{
    vmware-fusion
    virtualbox
    vagrant
    limechat
    sublime-text
    bettertouchtool
    cyberduck
    flux
    hex-fiend
    keyboardcleantool
    vlc
    wireshark
}.each do |package|
    homebrew_cask package do
        action :install
    end
end

homesick_castle 'dotfiles' do
  user    'admin'
  source  'git@github.com:thomasmeeus/dotfiles.git'
end


