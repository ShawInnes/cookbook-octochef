include Chef::Mixin::ShellOut

resource_name :octopus

default_action :deploy

property :project, String, name_property: true
property :deployto, String, required: true
property :version, String, required: true

property :server, String, default: 'http://localhost/octopus'
property :apikey, String, default: 'API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U'

load_current_value do

end

action :deploy do
  current_version = query_current_version

  log "current version is '#{current_version}'" do
    level :info
    not_if { current_version == version }
  end

  log "deploy '#{project}' Version '#{version}' to '#{deployto}'" do
    level :info
    not_if { current_version == version }
  end

  execute 'deploy-release' do
    command "octo deploy-release --server=\"#{server}\" --apiKey=\"#{apikey}\" --waitForDeployment --project=\"#{project}\" --deployTo=\"#{deployto}\" --releaseNumber=\"#{version}\""
    action :run
    not_if { current_version == version }
  end
end

def query_current_version
  octocmd = "octo list-latestdeployments --server=\"#{server}\" --apiKey=\"#{apikey}\" --project=\"#{project}\" --environment=\"#{deployto}\""
  output = shell_out! octocmd
  output = output.stdout

  match = output.match(/State: Success(\s+)Version: (?<version>.?*)[\r\n]/)
  match['version'].to_s.strip
end
