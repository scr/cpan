##############################
package URI::socks;
require URI::http;
#URI::implementor(socks => 'URI::http');
our @ISA = qw(URI::http);

1;
