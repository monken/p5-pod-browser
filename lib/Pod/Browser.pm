package Pod::Browser;
use strict;
use warnings;
# ABSTRACT: Pod Web Server based on Catalyst and ExtJS
use Catalyst::Runtime '5.90012';
use base qw/Catalyst/;

__PACKAGE__->config( name => 'Pod::Browser' );
__PACKAGE__->setup(qw/ ConfigLoader Static::Simple/);

sub { __PACKAGE__->run( @_) }

__END__

=head1 SYNOPSIS

  # pod_browser

  visit http://localhost:3030

=head1 DESCRIPTION

This is a L<Catalyst> server which serves PODs. It allows you to browse through your local
repository of modules. On the front page is a search box
which uses CPAN's xml interface to retrieve the results. If you click on one of them
the POD is displayed in this application.

Cross links in PODs are resolved and pop up as a new tab. If the module you clicked on is
not installed this controller fetches the source code from CPAN and creates the pod locally.
There is also a TOC which is always visible and scrolls the current POD to the selected section.

It is written using a JavaScript framework called ExtJS (L<http://www.extjs.com>) which
generates beautiful and rich user interfaces.

=begin html

<p><center><img src="http://cpan.org/authors/id/P/PE/PERLER/pod-images/pod-encyclopedia-01.png" width="882" height="462" /></center></p>

=end html

=head1 CONFIGURATION

First you have to locate the config file. Try

  # locate pod_browser.yml

in your command line and open it.

=over

=item inc (Boolean)

Search for modules in @INC. Set it to 1 or 0.

Defaults to C<0>.

=item namespaces (Arrayref)

Filter by namespaces. See L<Pod::Simple::Search> C<limit_glob> for syntax.

Defaults to C<["*"]>

=item self (Boolean)

Search for modules in C<< $c->path_to( 'lib' ) >>.


Defaults to C<1>.

=item dirs (Arrayref)

Search for modules in these directories.

Defaults to C<[]>.

=back

=head1 STARTING THE SERVER

C<pod_browser> makes use of L<Plack::Runner>. As a result, all options from L<plackup> are
also available to C<pod_browser>.

Run C<pod_browser --help> or see L<plackup> for more information.

=head1 INTEGRATION IN CATALYST

If you want to integrate this application directly into your catalyst application have a look at L<Catalyst::Controller::POD>.
This controller is used by this application.

=head1 SEE ALSO

L<Catalyst>, L<Catalyst::Controller::POD>

ExtJS (L<http://www.extjs.com>) is used for the user interface.

Other Pod Web Servers:

L<Pod::Server>, L<Pod::Webserver>, L<Pod::POM::Web>
