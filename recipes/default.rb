#
# Cookbook Name:: cookbook-octochef
# Recipe:: default
#
# Copyright (c) 2016 Shaw Innes, All Rights Reserved.

#include_recipe 'octochef::setup'
#include_recipe 'octochef::hosts'
#include_recipe 'octochef::dotnet'

#include_recipe 'octochef::features'
#include_recipe 'octochef::iis'
#include_recipe 'octochef::deploy'

#include_recipe 'octochef::seq'
#include_recipe 'octochef::firewall'


#package 'build-tools' do
#  source node['buildtools']['source']
#  options "/Passive /NoRestart /Log #{ENV['TEMP']}\\microsoft-build-tools-2015.log"
#  returns [0, 3010]
#  installer_type :custom
#  action :install
#end
