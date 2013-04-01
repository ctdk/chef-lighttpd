# 
# Cookbook Name: chef-lighttpd
# Definition: lighttpd_module
# Copyright 2011-2013, Kos Media LLC
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

# Activate or deactivate a lighttpd module

define :lighttpd_module, :enable => true do
  module_command = (params[:enable]) ? "lighttpd-enable-mod" : "lighttpd-disable-mod"
  include_recipe "chef-lighttpd"
  bash "run_lighty_mod" do
    user "root"
    code <<-EOH
      #{module_command} #{params[:name]}
    EOH
    notifies :restart, resources(:service => "lighttpd"), :delayed
  end
end
