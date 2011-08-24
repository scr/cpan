# -*- mode: perl -*-
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl LWP-Protocol-socks.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More;
my $hostname = `hostname`;
chomp($hostname);
if ( $hostname !~ /yahoo.com$/ ) {
    plan skip_all => 'not running from within Yahoo';
}
else {
    plan tests => 3;
}
use_ok(qw(LWP::UserAgent));
#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $ua = new LWP::UserAgent(agent => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.5) Gecko/20060719 Firefox/1.5.0.5');
ok($ua, 'got ua');

$ua->proxy([qw(http https)] => 'socks://socks.yahoo.com:1080');

my $response = $ua->get("http://www.freebsd.org");
is($response->code, 200, 'get www.freebsd.org code is 200')
    or diag(join(' ',$response->code,$response->message));
