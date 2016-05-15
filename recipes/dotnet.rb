#
# Cookbook Name:: cookbook-seq
# Recipe:: dotnet
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

sources = { '6c2c589132e830a185c5f40f82042bee3022e721a216680bd9b3995ba86f3781' => node['dotnet']['source'].to_s }

reboot 'now' do
  action :nothing
  reason 'Cannot continue Chef run without a reboot.'
end

ms_dotnet_framework '4.5.2' do
  action            :install
  include_patches   true
  package_sources   sources
  require_support   true
  notifies :reboot_now, 'reboot[now]', :immediately
end
