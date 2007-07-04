package Catalyst::Model::MozRepl;

use strict;
use warnings;

use base qw(Catalyst::Model);

use Catalyst::Exception;
use NEXT;
use MozRepl;

__PACKAGE__->mk_accessors(qw/repl/);

=head1 NAME

Catalyst::Model::MozRepl - Catalyst model to access mozilla using by MozRepl

=head1 VERSION

version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

  # In model
  __PACKAGE__->config(
    plugins => { plugins => [qw/Repl::Inspect/] }
  );

  # In controller
  my $repl = $c->model("Repl::Inspect")->repl;
  my $result = $repl->repl_inspect({ source => 'window.getBrowser().contentWindow.location' });

=head1 METHODS

=head2 new($arguments, $c)

Create Catalyst::Model::MozRepl instance.
See L<MozRepl>, L<Catalyst::Model>.

=cut

sub new {
    my $class = shift;
    my $arguments = pop;
    my $c = shift;

    $class->config($arguments);
    my $config = $class->config;

    my $self = $class->NEXT::new( $c, $config );

    eval {
        $self->repl(MozRepl->new($config));
        $self->repl->log($c->log);
        $self->repl->setup($config);
    };
    if (my $error = $@ ) {
        Catalyst::Exception->throw($error);
    }

    return $self;
}

=head2 repl

Return L<MozRepl> instance.

=cut

=head1 AUTHOR

Toru Yamaguchi, C<< <zigorou@cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-catalyst-model-mozrepl@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically be
notified of progress on your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2007 Toru Yamaguchi, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Catalyst::Model::MozRepl
