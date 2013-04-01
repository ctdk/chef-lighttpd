#
# Cookbook Name:: chef-lighttpd
# Attributes:: default
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

default[:lighttpd][:dir]     = "/etc/lighttpd"
default[:lighttpd][:log_dir] = "/var/log/lighttpd"
default[:lighttpd][:user]    = "www-data"
default[:lighttpd][:group]   = "www-data"
default[:lighttpd][:binary]  = "/usr/sbin/lighttpd"
default[:lighttpd][:doc_root] = "/var/www"
default[:lighttpd][:max_worker] = 1
default[:lighttpd][:pid_file] = "/var/run/lighttpd.pid"
default[:lighttpd][:encoding] = "utf-8"
default[:lighttpd][:dir_listing] = "disable"
default[:lighttpd][:max_fds] = 2048
default[:lighttpd][:max_connections] = 1024
default[:lighttpd][:use_ipv6] = "enable"
default[:lighttpd][:compress][:use_compress] = true
default[:lighttpd][:compress][:cache_dir] = "/var/tmp/lighttpd/cache/compress"
default[:lighttpd][:compress][:mime_types] = [ "text/html", "text/plain", "text/xml" ]
default[:lighttpd][:compress][:mime_types_non_ie6] = [ "text/css", "text/javascript", "application/javascript" ]
default[:lighttpd][:deploy_type] = "testing"
default[:lighttpd][:debug][:core_files] = "disable"
default[:lighttpd][:debug][:log_request_handling] = "disable"
default[:lighttpd][:debug][:log_state_handling] = "disable"
default[:lighttpd][:debug][:log_condition_handling] = "disable"
default[:lighttpd][:debug][:log_response_header] = "disable"
default[:lighttpd][:debug][:proxy] = "disable"
default[:lighttpd][:debug][:dump_unknown_headers] = "disable"
