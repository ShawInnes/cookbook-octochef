#
# Cookbook Name:: cookbook-octochef
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

octopus 'PublicWeb' do
  version '1.0.50'
  environment 'Development'
  action :deploy
end
