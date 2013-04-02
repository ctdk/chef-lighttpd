#
# Cookbook Name:: chef-lighttpd
# Recipe:: default
#
# Copyright 2011-2013, Kos Media, LLC
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

package "lighttpd" do
	action :install
end

service "lighttpd" do
  # need to support more platforms, someday, when I have the time
case node[:platform]
  when "debian","ubuntu"
    service_name "lighttpd"
    restart_command "/usr/sbin/invoke-rc.d lighttpd restart && sleep 1"
    reload_command "/usr/sbin/invoke-rc.d lighttpd restart && sleep 1" 
  end
  supports value_for_platform(
    "debian" => { "4.0" => [ :restart, :reload ], "default" => [ :restart, :reload, :status ] },
    "ubuntu" => { "default" => [ :restart, :reload, :status ] },
    "default" => { "default" => [:restart, :reload ] }
  )
  action :enable
end

cookbook_file "/usr/share/lighttpd/include-sites-enabled.pl" do
  source "include-sites-enabled.pl"
  mode 0755
  owner "root"
  group "root"
end

# make sites-available and sites-enabled
directory "/etc/lighttpd/sites-available" do
  action :create
  mode 0755
  owner "root"
  group "root"
end

directory "/etc/lighttpd/sites-enabled" do
  action :create
  mode 0755
  owner "root"
  group "root"
end

template "/etc/lighttpd/lighttpd.conf" do
  source "lighttpd.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
    :extforward_headers => node[:lighttpd][:extforward_headers],
    :extforward_forwarders => node[:lighttpd][:extforward_forwarders]
  )
  notifies :restart, resources(:service => "lighttpd"), :delayed
end

