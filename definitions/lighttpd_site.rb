#
# Cookbook Name:: lighttpd
# Definition:: lighttpd_site
#
# Copyright 2011, Kos Media LLC
#
# Figure out licensing later. Adapted from apache2's apache_site

define :lighttpd_site, :enable => true do
	include_recipe "lighttpd"

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
