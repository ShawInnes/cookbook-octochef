#
# Cookbook Name:: cookbook-octochef
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

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
