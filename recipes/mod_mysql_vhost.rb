#
# Cookbook Name:: chef-lighttpd
# Recipe:: mod_mysql_vhost
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

package "lighttpd-mod-mysql-vhost" do
  action :install
end

# If you use the mysql vhost module, you will probably want to modify this
# recipe to use whatever databags you want to use for storing the database
# username, password, etc. The template is provided as a reference, however, if
# you want to just use attributes.

template "/etc/lighttpd/conf-available/10-mysql-vhost.conf" do
  source "mysql_vhost.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "lighttpd"), :delayed
end

lighttpd_module "mysql-vhost"
