#
# Cookbook Name:: chef-lighttpd
# Definition:: lighttpd_site
#
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
#
# Adapted from apache2's apache_site

define :lighttpd_site, :enable => true do
	include_recipe "chef-lighttpd"

	if params[:enable]
		link "#{node[:lighttpd][:dir]}/sites-enabled/#{params[:server_name]}.conf" do
			to "#{node[:lighttpd][:dir]}/sites-available/#{params[:server_name]}.conf"
			owner "root"
			group "root"
			not_if do
				File.symlink?("#{node[:lighttpd][:dir]}/sites-enabled/#{params[:server_name]}.conf")
			end
			only_if do
				File.exists?("#{node[:lighttpd][:dir]}/sites-available/#{params[:server_name]}.conf")
			end
		end
	else
		link "#{node[:lighttpd][:dir]}/sites-enabled/#{params[:server_name]}.conf" do
			action :delete
			only_if do
				File.symlink?("#{node[:lighttpd][:dir]}/sites-enabled/#{params[:server_name]}.conf")
			end
		end
	end
end
