# attributes for lighttpd
# TODO: license junk etc.

default[:lighttpd][:dir]     = "/etc/lighttpd"
default[:lighttpd][:log_dir] = "/var/log/lighttpd"
default[:lighttpd][:user]    = "www-data"
default[:lighttpd][:group]   = "www-data"
default[:lighttpd][:binary]  = "/usr/sbin/lighttpd"
default[:lighttpd][:doc_root] = "/var/www"
default[:lighttpd][:max_worker] = 8
default[:lighttpd][:pid_file] = "/var/run/lighttpd.pid"
default[:lighttpd][:encoding] = "utf-8"
default[:lighttpd][:dir_listing] = "disable"
default[:lighttpd][:max_fds] = 8192
default[:lighttpd][:max_connections] = 4096
default[:lighttpd][:use_ipv6] = "enable"
default[:lighttpd][:extforward_headers] = [ "X-Cluster-Client-Ip", "X-Forwarded-For"]
default[:lighttpd][:extforward_forwarders] = [ "127.0.0.1" ]
default[:lighttpd][:deflate][:enable] = "disable"
default[:lighttpd][:deflate][:compression_level] = 9
default[:lighttpd][:deflate][:mem_level] = 9
default[:lighttpd][:deflate][:window_size] = 15
default[:lighttpd][:deflate][:min_compress_size] = 2
default[:lighttpd][:deflate][:sync_flush] = "enable"
default[:lighttpd][:deflate][:output_buffer_size] = 8192
default[:lighttpd][:deflate][:work_block_size] = 512
default[:lighttpd][:deflate][:debug] = "disable"
default[:lighttpd][:deflate][:mime_types] = [ "text/html", "text/plain", "text/xml" ]
default[:lighttpd][:deflate][:mime_types_non_ie6] = [ "text/css", "text/javascript", "application/javascript" ]
default[:lighttpd][:compress][:cache_dir] = "/var/tmp/lighttpd/cache/compress"
default[:lighttpd][:compress][:mime_types] = [ "text/html", "text/plain", "text/xml" ]
default[:lighttpd][:compress][:mime_types_non_ie6] = [ "text/css", "text/javascript", "application/javascript" ]
default[:lighttpd][:deploy_type] = "testing"
