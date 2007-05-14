use strict;
use warnings;
use IPC::Run qw(run);

sub libxml2_config {
    local $| = 1; # autoflush

    print "checking for libxml2... ";
    run ['xml2-config', '--version'], \undef, \(my $ver) or die "xml2-config: $?";
    print $ver;

    print "checking for libxml2 CFLAGS... ";
    run ['xml2-config', '--cflags'], \undef, \(my $cflags) or die "xml2-config: $?";
    print $cflags;

    print "checking for libxml2 LIBS... ";
    run ['xml2-config', '--libs'  ], \undef, \(my $libs  ) or die "xml2-config: $?";
    print $libs;

    return {
        CFLAGS => $cflags,
        LIBS   => $libs,
    };
}

1;
