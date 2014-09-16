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
    grc
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


directory "/Users#{node['current_user']}/.homesick/repos/dotfiles/home" do
    action 'create'
end
directory '/var/root/.homesick/repos/dotfiles/home' do
    action 'create'
end

homesick_castle 'dotfiles' do
  user node['current_user']
  source 'git@github.com:thomasmeeus/dotfiles.git'
end
homesick_castle 'dotfiles' do
  user 'root'
  source 'git@github.com:thomasmeeus/dotfiles.git'
end

include_recipe 'osxdefaults::dock_automatically_hide_and_show_the_dock'
include_recipe 'osxdefaults::dock_enable_spring_loading_for_all_dock_items'
include_recipe 'osxdefaults::dock_minimize_to_application'
include_recipe 'osxdefaults::dock_show_indicator_lights_for_open_applications_in_the_dock'
include_recipe 'osxdefaults::menu_show_clock_with_date'
include_recipe 'osxdefaults::mail_copy_email_addresses_instead_of_names_in_mail'
include_recipe 'osxdefaults::set_computer_name'
include_recipe 'osxdefaults::dock_set_the_icon_size_of_dock_items_to_36_pixels'
include_recipe 'osxdefaults::dock_set_magnification_on'
include_recipe 'osxdefaults::enable_safari_debug_menu'
include_recipe 'osxdefaults::enable_assistive_devices'
include_recipe 'osxdefaults::add_a_context_menu_item_for_showing_the_web_inspector_in_web_views'
include_recipe 'osxdefaults::avoid_creating_ds_store_files_on_network_volumes'
include_recipe 'osxdefaults::disable_auto-correct'
include_recipe 'osxdefaults::disable_gatekeeper'
include_recipe 'osxdefaults::disable_natural_scrolling'
include_recipe 'osxdefaults::disable_resume_system-wide'
include_recipe 'osxdefaults::enable_time_machine_on_unsupported_volumes'
include_recipe 'osxdefaults::expand_print_panel_by_default'
include_recipe 'osxdefaults::expand_save_panel_by_default'
include_recipe 'osxdefaults::finder_allow_text_selection_in_quick_look'
include_recipe 'osxdefaults::finder_automatically_open_a_new_finder_window_when_a_volume_is_mounted'
include_recipe 'osxdefaults::finder_display_full_path'
include_recipe 'osxdefaults::finder_set_preferred_view_style'
include_recipe 'osxdefaults::finder_show_all_files'
include_recipe 'osxdefaults::finder_show_file_extensions'
include_recipe 'osxdefaults::mail_disable_send_and_reply_animations_in_mail'
include_recipe 'osxdefaults::mail_when_searching_do_not_include_trash'
include_recipe 'osxdefaults::prevent_time_machine_from_prompting_to_use_new_hard_drives_as_backup_volume'
include_recipe 'osxdefaults::set_a_blazingly_fast_keyboard_repeat_rate'
include_recipe 'osxdefaults::set_screensaver_preferences'
include_recipe 'osxdefaults::tap_to_click'
include_recipe 'osxdefaults::set_terminal_profile'
