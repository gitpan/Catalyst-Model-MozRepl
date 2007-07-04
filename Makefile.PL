use inc::Module::Install;

name('Catalyst-Model-MozRepl');
author('Toru Yamaguchi <zigorou@cpan.org>');
abstract('Catalyst model to access mozilla using by MozRepl');
version_from('lib/Catalyst/Model/MozRepl.pm');
license('perl');

requires('MozRepl', 0.06);
requires('Catalyst::Exception');
requires('Catalyst::Model');
requires('Next');

build_requires('Test::WWW::Mechanize::Catalyst');

use_test_base;

auto_include;
auto_install;

WriteAll;
