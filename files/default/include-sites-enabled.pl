#!/usr/bin/perl -wl

use strict;
use File::Glob ':glob';

my $confdir = "/etc/lighttpd/";
my $enabled = "sites-enabled/*.conf";

chdir($confdir);
my @files = bsd_glob($enabled);

for my $file (@files)
{
	print "include \"$file\"";
}
