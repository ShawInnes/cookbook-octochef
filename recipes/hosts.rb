#
# Cookbook Name:: cookbook-octochef
# Recipe:: hosts
#
# Copyright (c) 2016 Shaw Innes, All Rights Reserved.

append_line 'c:\windows\system32\drivers\etc\hosts' do
  line '127.0.0.1   development.demo'
end

append_line 'c:\windows\system32\drivers\etc\hosts' do
  line '127.0.0.1   test.demo'
end

append_line 'c:\windows\system32\drivers\etc\hosts' do
  line '127.0.0.1   production.demo'
end
