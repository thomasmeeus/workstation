#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/opt/homebrew-cask/Caskroom' do
  action :create
  recursive true
  mode '0755'
  owner  node['current_user']
  group 'staff'
end

directory '/opt/homebrew-cask' do
  owner node['current_user']
end

include_recipe 'homebrew::default'
include_recipe 'homesick::default'

homebrew_tap 'homebrew/dupes'
homebrew_tap 'homebrew/versions'
homebrew_tap 'homebrew/homebrew-php'
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
  user node['current_user']
  source 'git@github.com:thomasmeeus/dotfiles.git'
end


