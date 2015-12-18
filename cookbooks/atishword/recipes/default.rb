#
# Cookbook Name:: atishword
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'atishword::base'
include_recipe 'atishword::apache'
include_recipe 'atishword::php'
include_recipe 'atishword::mysql'
include_recipe 'atishword::core'