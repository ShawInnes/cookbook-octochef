#
# Cookbook Name:: cookbook-octochef
# Recipe:: features
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

features = %w('Web-WebServer', 'Web-Asp-Net45', 'Web-Scripting-Tools', 'Web-Mgmt-Console')

features.each do |feature|
  windows_feature feature do
    provider Chef::Provider::WindowsFeaturePowershell
    action :install
  end
end
