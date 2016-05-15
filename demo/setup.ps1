
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" configure --instance "OctopusServer" --webForceSSL "False"
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" configure --instance "OctopusServer" --webListenPrefixes "http://localhost/octopus"
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" service --instance "OctopusServer" --stop --start

wget https://api.nuget.org/packages/octosample.orderprocessingserver.1.0.50.nupkg -Outfile octosample.orderprocessingserver.1.0.50.nupkg
wget https://api.nuget.org/packages/octosample.publicweb.1.0.50.nupkg -Outfile octosample.publicweb.1.0.50.nupkg


octo push --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --replace-existing --package="octosample.orderprocessingserver.1.0.50.nupkg"
octo push --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --replace-existing --package="octosample.publicweb.1.0.50.nupkg"

octo create-environment --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="Development"
octo create-environment --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="Test"
octo create-environment --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="Production"

octo create-project --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="PublicWeb" --projectGroup="Demo" --lifecycle="Default Lifecycle"
octo create-project --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="OrderProcessingServer" --projectGroup="Demo" --lifecycle="Default Lifecycle"

octo create-release --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreExisting --releaseNumber="1.0.50" --project "PublicWeb"
octo create-release --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreExisting --releaseNumber="1.0.50" --project "OrderProcessingServer"

octo export --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --type="Project" --name="PublicWeb" --releaseVersion="1.0.50" --filePath="PublicWeb.json"
octo export --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --type="Project" --name="OrderProcessingServer" --releaseVersion="1.0.50" --filePath="OrderProcessingServer.json"

octo import --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --type="Project" --project="PublicWeb" --filePath="PublicWeb.json"
octo import --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --type="Project" --project="OrderProcessingServer" --filePath="OrderProcessingServer.json"

octo deploy-release --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --waitForDeployment --project="PublicWeb" --deployTo="Development" --releaseNumber="1.0.50"
octo deploy-release --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --waitForDeployment --project="PublicWeb" --deployTo="Test" --releaseNumber="1.0.50"
octo deploy-release --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --waitForDeployment --project="PublicWeb" --deployTo="Production" --releaseNumber="1.0.50"

octo list-latestdeployments --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --project="PublicWeb" --environment="Development"
octo list-latestdeployments --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --project="PublicWeb" --environment="Test"
octo list-latestdeployments --server=http://localhost/octopus --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --project="PublicWeb" --environment="Production"
