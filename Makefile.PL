# IMPORTANT: if you delete this file your app will not work as
# expected.  you have been warned
use inc::Module::Install;

name 'Pod-Browser';
all_from 'lib/Pod/Browser.pm';

repository 'http://github.com/monken/Pod-Browser/tree/master';

requires 'Catalyst::Runtime' => '5.7014';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Controller::POD' => "1.0.0";
requires 'parent';
requires 'YAML::Syck';
catalyst;

install_script glob('script/*');
auto_install;
WriteAll;
