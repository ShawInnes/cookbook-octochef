#
# Cookbook Name:: cookbook-octochef
# Recipe:: iis
#
# Copyright (c) 2016 Shaw Innes, All Rights Reserved.

iis_site 'Default Web Site' do
  action [:stop, :delete]
end

iis_pool '.NET v4.5' do
  action [:stop, :delete]
end

iis_pool '.NET v4.5 Classic' do
  action [:stop, :delete]
end

iis_pool 'DefaultAppPool' do
  action [:stop, :delete]
end
