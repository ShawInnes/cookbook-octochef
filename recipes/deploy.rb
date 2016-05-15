#
# Cookbook Name:: cookbook-seq
# Recipe:: deploy
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

octopus 'Something' do
  version '1.5.0'
  environment 'production'
  action :deploy
end
