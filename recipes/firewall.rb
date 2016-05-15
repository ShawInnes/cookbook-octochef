#
# Cookbook Name:: cookbook-octochef
# Recipe:: firewall
#
# Copyright (c) 2016 Shaw Innes, All Rights Reserved.

windows_firewall_rule 'PublicWeb' do
  localport '80'
  protocol 'TCP'
  firewall_action :allow
end

windows_firewall_rule 'Seq' do
  localport '5341'
  protocol 'TCP'
  firewall_action :allow
end
