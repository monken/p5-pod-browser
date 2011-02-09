#!/usr/bin/env perl
# PODNAME: pod_browser_cgi.pl
BEGIN { $ENV{CATALYST_ENGINE} ||= 'CGI' }

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Pod::Browser;

Pod::Browser->run;

1;
