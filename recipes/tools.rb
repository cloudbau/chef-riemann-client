#
# Cookbook Name:: riemann-client
# Recipe:: tools
#
# Copyright (C) 2013 cloudbau GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 

include_recipe "riemann-client::default"

%w{
  libxml2-devel
  libxslt-devel
}.each { |pkg| package pkg }

rbenv_gem "riemann-tools" do
  ruby_version node[:riemann][:ruby_version]
  version node[:riemann][:tools_version]
  action :install
  notifies :run, 'bash[rbenv rehash]'
end

bash('rbenv rehash'){ action :nothing }