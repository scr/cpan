package LWP::Protocol::socks4;
require LWP::Protocol::socks;
our @ISA = qw(LWP::Protocol);

sub request {
    my($self, $request, $proxy, $arg, $size, $timeout) = @_;
    my $url = $request->uri;
    my $scheme = $url->scheme;
    my $protocol = LWP::Protocol::create("$scheme\::socks", $self->{ua});
    $protocol->{proxy_sock_opts} = [ProxyAddr => $proxy->host,
                    ProxyPort => $proxy->port,
                    SocksVersion => 4
                    ];
    
    if ( $proxy->userinfo() ) {
        push(@{$protocol->{proxy_sock_opts}},
         Username => $proxy->user()
        );
    }
    
    $protocol->request($request, undef, $arg, $size, $timeout);
}

1;
