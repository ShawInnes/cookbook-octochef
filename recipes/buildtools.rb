#
# Cookbook Name:: cookbook-octochef
# Recipe:: buildtools
#
# Copyright (c) 2016 Shaw Innes, All Rights Reserved.

package 'build-tools' do
  source node['buildtools']['source']
  options "/Passive /NoRestart /Log #{ENV['TEMP']}\\microsoft-build-tools-2015.log"
  returns [0, 3010]
  installer_type :custom
  action :install
end
