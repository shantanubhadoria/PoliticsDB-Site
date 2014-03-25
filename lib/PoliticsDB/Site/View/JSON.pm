package PoliticsDB::Site::View::JSON;

use strict;
use base 'Catalyst::View::JSON';

use JSON::XS ();

sub encode_json {
    my($self, $c, $data) = @_;
    my $encoder = JSON::XS->new->utf8->pretty->allow_nonref->convert_blessed;
    $encoder->encode($data);
}

=head1 NAME

PoliticsDB::Site::View::JSON - Catalyst JSON View

=head1 SYNOPSIS

See L<PoliticsDB::Site>

=head1 DESCRIPTION

Catalyst JSON View.

=head1 AUTHOR

Shantanu Bhadoria,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
