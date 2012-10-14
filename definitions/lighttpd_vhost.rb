# 
# Cookbook Name: chef-lighttpd
# Definition: lighttpd_vhost
# Copyright 2011, Kos Media LLC
#
# Figure out licensing
#
# Adapted from web_app in apache2 recipe

define :lighttpd_vhost, :template => "lighttpd_vhost.conf.erb" do
	vhost_name = params[:server_name]
	include_recipe "lighttpd"

	template "#{node[:lighttpd][:dir]}/sites-available/#{vhost_name}.conf" do
		source params[:template]
		owner "root"
		group "root"
		mode 0644
		if params[:cookbook]
			cookbook params[:cookbook]
		end
		variables(
			:vhost_name => vhost_name,
			:params => params
		)
		if File.exists?("#{node[:lighttpd][:dir]}/sites-enabled/#{vhost_name}.conf")
			notifies :restart, resources(:service => "lighttpd"), :delayed
		end
	end

	lighttpd_site "#{params[:server_name]}.conf" do
		#enable enable_setting
		server_name params[:server_name]
		enable true
	end

end
