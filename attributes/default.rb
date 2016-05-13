default['packages'] = 'http://10.0.1.31:8888'

# default['seq']['source'] = 'https://getseq.blob.core.windows.net/releases/Seq-3.1.17.msi'
default['seq']['version'] = "3.2.2-pre"
default['seq']['source'] = "#{node['packages']}/Seq-#{node['seq']['version']}.msi"

# default['dotnet']['source'] = 'https://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe'

default['dotnet']['source'] = "#{node['packages']}/NDP452-KB2901907-x86-x64-AllOS-ENU.exe"
