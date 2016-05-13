resource_name :octopus

default_action :deploy

property :project, String, name_property: true
property :environment, String, required: true
property :version, String, required: true

load_current_value do
  # some Ruby
end

action :deploy do
  log "deploy '#{project}' Version '#{version}' to '#{environment}'" do
    level :info
  end
end

#  payload = {
#    :EnvironmentId => 'xxx',
#    :ReleaseId => 'xxx',
#    :SpecificMachineIds => ''
#  }.to_json
#  http_request 'deploy' do
#    url "#{baseurl}/api//deployments"
#    action :post
#    message (payload)
#    headers({'X-Octopus-ApiKey' => "#{apikey}"})
#  end
