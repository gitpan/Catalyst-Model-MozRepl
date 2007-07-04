package Catalyst::Helper::Model::MozRepl;

use strict;
use warnings;

=head1 NAME

Catalyst::Helper::Model::MozRepl - Helper class for Catalyst::Model::MozRepl

=head1 VERSION

version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

  script/myapp_create.pl model My::Model::Name MozRepl

=head1 METHODS

=head2 mk_compclass

Generate L<Catalyst::Model::MozRepl> model class.

=cut

sub mk_compclass {
    my ($self, $helper, $domain) = @_;

    $helper->render_file('modelclass', $helper->{file});

    return 1;
}

=head1 AUTHOR

Toru Yamaguchi, C<< <zigorou@cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-catalyst-helper-model-mozrepl@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically be
notified of progress on your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2007 Toru Yamaguchi, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Catalyst::Helper::Model::MozRepl

__DATA__

=begin pod_to_ignore

__modelclass__

package [% class %];

use strict;
use warnings;

use base qw/Catalyst::Model::MozRepl/;

# __PACKAGE__->config();

=head1 NAME

[% class %] - Catalyst model to access mozilla using by MozRepl.

=head1 SYNOPSIS

SEE L<[% app %]>

=head1 DESCRIPTION

See L<Catalyst::Model::MozRepl>, L<MozRepl>

=head1 AUTHOR

[% author %]

=head1 LICENSE

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
