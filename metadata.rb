maintainer       "Kos Media, LLC"
maintainer_email "jeremy@dailykos.com"
license          "Apache 2.0"
description      "Installs/Configures chef-lighttpd"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.3.0"

attribute "lighttpd",
  :display_name => "Lighttpd perl Hash",
  :description => "Hash of lighttpd attributes",
  :type => "hash"

attribute "lighttpd/dir",
  :display_name => "lighttpd root dir",
  :description => "Root lighttpd configuration directory",
  :default => "/etc/lighttpd"

attribute "lighttpd/log_dir",
  :display_name => "lighttpd log dir",
  :description => "Log directory for lighttpd",
  :default => "/var/log/lighttpd"

attribute "lighttpd/user",
  :display_name => "lighttpd user",
  :description => "lighttpd user",
  :default => "www-data"

attribute "lighttpd/group",
  :display_name => "lighttpd group",
  :description => "lighttpd group",
  :default => "www-data"

attribute "lighttpd/doc_root",
  :display_name => "lighttpd doc root",
  :description => "lighttpd doc root",
  :default => "/var/www"

attribute "lighttpd/max_worker",
  :display_name => "Max worker",
  :description => "Max worker",
  :default => "8"

attribute "lighttpd/pid_file",
  :display_name => "Pid file",
  :description => "Pid file",
  :default => "/var/run/lighttpd"

attribute "lighttpd/encoding",
  :display_name => "character encoding",
  :description => "character encoding",
  :default => "utf-8"

attribute "lighttpd/dir_listing",
  :display_name => "dir listing",
  :description => "dir listing",
  :default => "disable"

attribute "lighttpd/max_fds",
  :display_name => "max file descriptors",
  :description => "max file descriptors",
  :default => "8192"

attribute "lighttpd/max_connections",
  :display_name => "max connections",
  :description => "max connections",
  :default => "4096"

attribute "lighttpd/use_ipv6",
  :display_name => "use ipv6",
  :description => "use ipv6",
  :default => "enable"

# compress hash, get it out of the way
attribute "lighttpd/compress",
  :display_name => "lighttpd compress",
  :description => "Hash of lighttpd compress options",
  :type => "hash"

attribute "lighttpd/compress/use_compress",
  :display_name => "Use the mod_compress cache dir",
  :description => "use mod_compress cache dir",
  :default => "true"

attribute "lighttpd/compress/mime_types",
  :display_name => "compress mime types",
  :description => "compress mime types (for most browers anyway)",
  :type => "array",
  :default =>  [ "text/html", "text/plain", "text/xml" ]

attribute "lighttpd/compress/mime_types_non_ie6",
  :display_name => "compress mime types non-ie5 or 6",
  :description => "compress mime types for browsers that support compression and aren't IE5 or IE6",
  :type => "array",
  :default =>  [ "text/css", "text/javascript", "application/javascript" ]

attribute "lighttpd/compress/cache_dir",
  :display_name => "compress cache dir",
  :description => "compress cache dir",
  :default => "/var/tmp/lighttpd/cache/compress"

# Debug hash
attribute "lighttpd/debug",
  :display_name => "Lighttpd Debug options",
  :description => "Hash of debug options for lighttpd",
  :type => "hash"

attribute "lighttpd/debug/proxy",
  :display_name => "debug proxy",
  :description => "debug the proxy engine",
  :default => "disable"

attribute "lighttpd/debug/core_files",
  :display_name => "debug proxy",
  :description => "debug the proxy engine",
  :default => "disable"

attribute "lighttpd/debug/dump_unknown_headers",
  :display_name => "debug unknown headers",
  :description => "Dump unknown headers to disk",
  :default => "disable"

attribute "lighttpd/debug/log_request_handling",
  :display_name => "debug log request handling",
  :description => "Log request handling",
  :default => "disable"

attribute "lighttpd/debug/log_state_handling",
  :display_name => "debug log state handling",
  :description => "Log state handling",
  :default => "disable"

attribute "lighttpd/debug/log_condition_handling",
  :display_name => "debug log condition handling",
  :description => "Log condition handling",
  :default => "disable"

attribute "lighttpd/debug/log_response_header",
  :display_name => "debug log response header",
  :description => "Log response headers",
  :default => "disable"
