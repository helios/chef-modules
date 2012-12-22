#
# Cookbook Name:: modules
# Recipe:: source
#
# Copyright (C) 2012 Allan Espinosa
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "ark"

package "tcl-dev" do
end.run_action(:install)

ark "modules" do
  prefix_root Chef::Config.file_cache_path
  url "http://downloads.sourceforge.net/project/modules/Modules/modules-3.2.10/modules-3.2.10.tar.bz2"
  version "3.2.10"
  action :install_with_make
  make_opts %w(-j 2)
end.run_action(:configure)

modules = resources("ark[modules]")
link modules.home_dir do
  action :delete
end
