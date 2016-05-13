#
# Cookbook Name:: seq
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

sources = { '6c2c589132e830a185c5f40f82042bee3022e721a216680bd9b3995ba86f3781' => node['dotnet']['source'].to_s }

ms_dotnet_framework '4.5.2' do
  action            :install
  include_patches   true
  package_sources   sources
  require_support   true
end

package 'Seq' do
  source node['seq']['source']
  action :install
end

execute 'Install Seq Service' do
  command '"C:\Program Files\Seq\Seq.exe" install --setup'
  action :run
  not_if '($svc = (gwmi -class Win32_Service | Where-Object {$_.Name -eq "Seq"}).Name -eq "Seq")'
end

service 'Seq' do
  action [:enable, :start]
end

octopus 'Something' do
  version '1.5.0'
  environment 'production'
  action :deploy
end
