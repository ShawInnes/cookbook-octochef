#
# Cookbook Name:: cookbook-octochef
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# include_recipe 'octochef::setup'
# include_recipe 'octochef::hosts'
# include_recipe 'octochef::dotnet'

# include_recipe 'octochef::features'
include_recipe 'octochef::iis'
include_recipe 'octochef::deploy'

include_recipe 'octochef::seq'
include_recipe 'octochef::firewall'
