use lib qw(t/TestApp/lib);
use Test::More tests => 2;
use Test::WWW::Mechanize::Catalyst 'TestApp';

my $mech = Test::WWW::Mechanize::Catalyst->new;
$mech->get_ok("/");
$mech->content_is("MozRepl");

