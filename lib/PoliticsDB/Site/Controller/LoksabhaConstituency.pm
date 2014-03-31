package PoliticsDB::Site::Controller::LoksabhaConstituency;
use Moose;
use namespace::autoclean;
use JSON;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

PoliticsDB::Site::Controller::LoksabhaConstituency - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 base

=cut

sub base :Chained('/base') :PathPart('loksabhaconstituency') :CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

=head2 list 

=cut

sub list :Chained('base') :PathPart('list') :Args(0) {
    my ( $self, $c ) = @_;

    my $states = $c->model('DBIC::LoksabhaConstituency')->search(
        undef,
        {
        },
    )->hashref_array;
    $c->stash->{json}->{loksabhaconstituencies} = $states;
}

=head2 add 

=cut

sub add :Chained('base') :PathPart('add') :Args(0) {
    my ( $self, $c ) = @_;
    my $params = $c->request->parameters;

    if( !$c->check_user_roles('admin') ) {
        my $states = $c->model('DBIC::LoksabhaConstituency')->create({
                name                => $params->{name},
                constituency_number => $params->{constituency_number},
                state_code          => (($params->{state_code} eq '') ? undef : $params->{state_code}) ,
                is_union_territory  => $params->{is_union_territory},
                reserved_for        => $params->{reserved_for},
            });
        $c->stash(
            json => {
                success => JSON::true(),
                status_message => 'Constituency Created',
            }
        );
    } else {
        $c->stash(
            json => {
                success        => JSON::false(),
                status_message => 'No Permissions',
            }
        );

    }
}

=head2 update

=cut

sub update :Chained('base') :PathPart('update') :Args(0) {
    my ( $self, $c ) = @_;
    my $params = $c->request->parameters;

    if( !$c->check_user_roles('admin') ) {
        my $states = $c->model('DBIC::LoksabhaConstituency')->find($params->{id})->update({
                name => $params->{name},
                constituency_number => $params->{constituency_number},
                state_code => (($params->{state_code} eq '') ? undef : $params->{state_code}) ,
                is_union_territory => $params->{is_union_territory},
                reserved_for => $params->{reserved_for},
            });
        $c->stash(
            json => {
                success => JSON::true(),
                status_message => 'Constituencies Updated',
            }
        );
    } else {
        $c->stash(
            json => {
                success => JSON::false(),
                status_message => 'No Permissions',
            }
        );

    }
}

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched PoliticsDB::Site::Controller::LoksabhaConstituency in LoksabhaConstituency.');
}


=head1 AUTHOR

Shantanu Bhadoria,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
