#
# Cookbook Name:: cookbook-octochef
# Recipe:: features
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

windows_feature 'Web-WebServer' do
  provider Chef::Provider::WindowsFeaturePowershell
  action :install
end

windows_feature 'Web-Asp-Net45' do
  provider Chef::Provider::WindowsFeaturePowershell
  action :install
end

windows_feature 'Web-Scripting-Tools' do
  provider Chef::Provider::WindowsFeaturePowershell
  action :install
end

windows_feature 'Web-Mgmt-Console' do
  provider Chef::Provider::WindowsFeaturePowershell
  action :install
end
