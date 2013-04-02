Description
===========
Installs and configures the lighttpd webserver [`http://www.lighttpd.net`](http://www.lighttpd.net), a light, fast webserver.

Requirements
============
Currently only tested and supported on Debian and Ubuntu.

Attributes
==========
See `attributes/default.rb` and [the lighttpd docs](http://redmine.lighttpd.net/projects/lighttpd/wiki) for the default values and their explanation. The defaults are pretty sane, but they can be tweaked as needed.

Of particular interest are the `max_worker`, `max_fds`, and `max_connections` attributes for performance tuning. Read more at [`http://redmine.lighttpd.net/projects/lighttpd/wiki/Docs_ConfigurationOptions`](http://redmine.lighttpd.net/projects/lighttpd/wiki/Docs_ConfigurationOptions) for very detailed explanations of all of the options available.

Usage
=====
Include `recipe[chef-lighttpd]` in your runlist to install lighttpd. To configure and enable virtual hosts, use the `lighttpd_vhost` and `lighttpd_site` definitions by including the recipe in your cookbook. The `lighttpd_vhost` definition will create and configure a virtual host configuration, and `lighttpd_site` will enable it. `lighttpd_vhost` uses a very sparse configuration by default, so you will want to extend it if you want more than an extremely simple virtual host. Just pass in whatever settings you want in the vhost config as params when you call the lighttpd_vhost definition. lighttpd_vhost was adapted from apache2's web_app definition, while lighttpd_site was adapted from apache_site. They work very similarly to those.

Usually, you will not need to call `lighttpd_site` directly - just pass in `enable` as a param when you call `lighttpd_vhost`, and that will call lighttpd_site for you. However, it's available if you need to call it directly.

There are also recipes for installing different modules you might want. Just include the appropriate recipe in your run list to install them. Currently mod_access, mod_alias, mod_accesslog, mod_rewrite, mod_redirect, mod_status, mod_compress, and mod_expire are included by default.

Available modules to install separately are:

* mod_auth
* mod_cgi
* mod_cml
* mod_evasive
* mod_evhost
* mod_expire
* mod_fastcgi
* mod_flv_streaming
* mod_magnet
* mod_mysql_vhost
* mod_no_www
* mod_proxy
* mod_rddtool
* mod_simple_vhost
* mod_ssi
* mod_ssl
* mod_status
* mod_trigger_b4_dl
* mod_userdir
* mod_usertrack
* mod_webdav

TODO
====
* Add RHEL/CentOS support
* Add test-kitchen

LICENSE
=======

Author:: Jeremy Bingham (<jeremy@dailykos.com>)
Copyright:: 2011-2013, Kos Media, LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
