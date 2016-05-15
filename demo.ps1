
wget https://api.nuget.org/packages/octosample.orderprocessingserver.1.0.50.nupkg -Outfile octosample.orderprocessingserver.1.0.50.nupkg
wget https://api.nuget.org/packages/octosample.publicweb.1.0.50.nupkg -Outfile octosample.publicweb.1.0.50.nupkg


octo push --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --replace-existing --package="octosample.orderprocessingserver.1.0.50.nupkg"
octo push --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --replace-existing --package="octosample.publicweb.1.0.50.nupkg"

octo create-environment --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="Development"
octo create-environment --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="Test"
octo create-environment --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="Production"

octo create-project --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="PublicWeb" --projectGroup="Demo" --lifecycle="Default Lifecycle"
octo create-release --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreExisting --releaseNumber="1.0.50" --project "PublicWeb" --deployTo="Development"

octo create-project --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreIfExists --name="OrderProcessingServer" --projectGroup="Demo" --lifecycle="Default Lifecycle"
octo create-release --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --ignoreExisting --releaseNumber="1.0.50" --project "OrderProcessingServer" --deployTo="Development"

octo export --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --type="Project" --name="PublicWeb" --releaseVersion="1.0.50" --filePath="PublicWeb.json"
octo export --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --type="Project" --name="OrderProcessingServer" --releaseVersion="1.0.50" --filePath="OrderProcessingServer.json"

octo import --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --type="Project" --project="PublicWeb" --filePath="PublicWeb.json"
octo import --server=http://localhost --apiKey=API-RJHCGXDDWUAGNS7GBQTVK3ZQ0U --type="Project" --project="OrderProcessingServer" --filePath="OrderProcessingServer.json"
