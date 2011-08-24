use 5.006001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'LWP::Protocol::socks',
    VERSION_FROM      => 'lib/LWP/Protocol/socks.pm', # finds $VERSION
    'PREREQ_PM' => {
        'IO::Socket::Socks' => 0.2,
        'IO::Socket::SSL'   => 0.96,
        'LWP'               => 0,
    },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/LWP/Protocol/socks.pm', # retrieve abstract from module
       AUTHOR         => 'Sheridan C Rawlins <sheridan.rawlins@yahoo.com>') : ()),
);
