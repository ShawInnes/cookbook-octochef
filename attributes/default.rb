default['packagesweb'] = 'http://10.0.1.31:8888'

# default['seq']['source'] = 'https://getseq.blob.core.windows.net/releases/Seq-3.1.17.msi'
default['seq']['version'] = '3.2.2-pre'
default['seq']['source'] = "#{node['packagesweb']}/Seq-#{node['seq']['version']}.msi"

# default['dotnet']['source'] = 'https://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe'
default['dotnet']['source'] = "#{node['packagesweb']}/NDP452-KB2901907-x86-x64-AllOS-ENU.exe"

#default['powershell']['powershell5']['url'] = 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win8.1AndW2K12R2-KB3066437-x64.msu'
default['powershell']['powershell5']['url'] = "#{node['packagesweb']}/Win8.1AndW2K12R2-KB3066437-x64.msu"

# default['buildtools']['source'] = 'http://download.microsoft.com/download/E/E/D/EEDF18A8-4AED-4CE0-BEBE-70A83094FC5A/BuildTools_Full.exe'
default['buildtools']['source'] = "#{node['packagesweb']}/BuildTools_Full.exe"
