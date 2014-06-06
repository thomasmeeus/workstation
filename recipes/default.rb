#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

homesick_castle 'dotfiles' do
  user    'thomas'
  source  'git@github.com:thomasmeeus/dotfiles.git'
end
