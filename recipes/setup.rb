#
# Cookbook Name:: cookbook-seq
# Recipe:: setup
#
# Copyright (c) 2016 Shaw Innes, All Rights Reserved.

setup_done = ::Dir.exist?('C:\SetupDone')

cookbook_file "#{Chef::Config[:file_cache_path]}/octosample.orderprocessingserver.1.0.50.nupkg" do
  source 'octosample.orderprocessingserver.1.0.50.nupkg'
  action :create
  not_if { setup_done }
end

cookbook_file "#{Chef::Config[:file_cache_path]}/octosample.publicweb.1.0.50.nupkg" do
  source 'octosample.publicweb.1.0.50.nupkg'
  action :create
  not_if { setup_done }
end

cookbook_file "#{Chef::Config[:file_cache_path]}/OrderProcessingServer.json" do
  source 'OrderProcessingServer.json'
  action :create
  not_if { setup_done }
end

cookbook_file "#{Chef::Config[:file_cache_path]}/PublicWeb.json" do
  source 'PublicWeb.json'
  action :create
  not_if { setup_done }
end

execute 'reconfigure octopus server - disable ssl' do
  command '"C:\\Program Files\\Octopus Deploy\\Octopus\\Octopus.Server.exe" configure --console --instance "OctopusServer" --webForceSSL "False"'
  not_if { setup_done }
end

execute 'reconfigure octopus server - configure web prefix' do
  command '"C:\\Program Files\\Octopus Deploy\\Octopus\\Octopus.Server.exe" configure --console --instance "OctopusServer" --webListenPrefixes "http://localhost/octopus"'
  not_if { setup_done }
end

execute 'reconfigure octopus server - restart' do
  command '"C:\\Program Files\\Octopus Deploy\\Octopus\\Octopus.Server.exe" service --console --instance "OctopusServer" --stop --start'
  not_if { setup_done }
end

powershell_script 'upload demo packages' do
  code <<-EOH
  & octo push --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --replace-existing --package="#{Chef::Config[:file_cache_path]}/octosample.orderprocessingserver.1.0.50.nupkg"
  & octo push --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --replace-existing --package="#{Chef::Config[:file_cache_path]}/octosample.publicweb.1.0.50.nupkg"
  EOH
  not_if { setup_done }
end

powershell_script 'create test data' do
  code <<-EOH
  & octo create-environment --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="Development"
  & octo create-environment --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="Test"
  & octo create-environment --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="Production"

  & octo create-project --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="PublicWeb" --projectGroup="Demo" --lifecycle="Default Lifecycle"
  & octo create-project --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="OrderProcessingServer" --projectGroup="Demo" --lifecycle="Default Lifecycle"

  & octo import --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --type="Project" --project="PublicWeb" --filePath="#{Chef::Config[:file_cache_path]}/PublicWeb.json"
  & octo import --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --type="Project" --project="OrderProcessingServer" --filePath="#{Chef::Config[:file_cache_path]}/OrderProcessingServer.json"

  & octo create-release --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreExisting --releaseNumber="1.0.50" --project "PublicWeb"
  & octo create-release --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreExisting --releaseNumber="1.0.60" --project "PublicWeb"
  & octo create-release --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreExisting --releaseNumber="1.0.70" --project "PublicWeb"
  & octo create-release --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreExisting --releaseNumber="1.0.80" --project "PublicWeb"

  & octo create-release --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreExisting --releaseNumber="1.0.50" --project "OrderProcessingServer"
  EOH
  not_if { setup_done }
end

directory 'C:\SetupDone' do
  action :create
end
