It "should expose a nuget packages feed" {
    $packages = Invoke-RestMethod -Uri "http://localhost:5341/"
    $packages.Version | should be "3.2.2.a0"
} 

It "Should have the Web Server Role" { 
    (Get-WindowsFeature -name Web-Server).Installed | Should Be $true # Probably not the right service name but it's okay for now.
}