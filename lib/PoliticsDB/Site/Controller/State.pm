package PoliticsDB::Site::Controller::State;
use Moose;
use namespace::autoclean;
use JSON;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

PoliticsDB::Site::Controller::State - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 base

=cut

sub base :Chained('/base') :PathPart('state') :CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

=head2 list 

=cut

sub list :Chained('base') :PathPart('list') :Args(0) {
    my ( $self, $c ) = @_;

    my $states = $c->model('DBIC::State')->search(
        undef,
        {
            select => [
                "me.state_code",
                "me.name",
            ],
        },
    )->hashref_array;
    $c->stash->{json}->{states} = $states;
}

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched PoliticsDB::Site::Controller::State in State.');
}


=head1 AUTHOR

Shantanu Bhadoria,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
