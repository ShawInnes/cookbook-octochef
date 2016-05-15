#
# Cookbook Name:: cookbook-octochef
# Recipe:: deploy
#
# Copyright (c) 2016 Shaw Innes, All Rights Reserved.

octopus 'PublicWeb' do
  version '1.0.50'
  deployto 'Development'
  action :deploy
end

#octopus 'PublicWeb' do
#  version '1.0.70'
#  deployto 'Test'
#  action :deploy
#end

#octopus 'PublicWeb' do
#  version '1.0.60'
#  deployto 'Production'
#  action :deploy
#end
