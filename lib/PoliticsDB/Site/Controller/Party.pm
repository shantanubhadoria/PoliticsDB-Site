package PoliticsDB::Site::Controller::Party;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

PoliticsDB::Site::Controller::Party - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 base

=cut

sub base :Chained('/base') :PathPart('party') :CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

=head2 list 

=cut

sub list :Chained('base') :PathPart('list') :Args(0) {
    my ( $self, $c ) = @_;

    my $states = $c->model('DBIC::PoliticalParty')->search(
        undef,
        {
        },
    )->hashref_array;
    $c->stash->{json}->{parties} = $states;
}

=head2 add 

=cut

sub add :Chained('base') :PathPart('add') :Args(0) {
    my ( $self, $c ) = @_;
    my $params = $c->request->parameters;

    if( !$c->check_user_roles('admin') ) {
        my $states = $c->model('DBIC::PoliticalParty')->create({
                type_of_party            => $params->{type_of_party},
                election_symbol          => $params->{election_symbol},
                name                     => $params->{name},
                founding_year            => $params->{founding_year},
                election_symbol_image_96 => $params->{election_symbol_image_96},
            });
        $c->stash(
            json => {
                success        => JSON::true(),
                status_message => 'Party Created',
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
        my $states = $c->model('DBIC::PoliticalParty')->find($params->{id})->update({
                type_of_party            => $params->{type_of_party},
                election_symbol          => $params->{election_symbol},
                name                     => $params->{name},
                founding_year            => $params->{founding_year},
                election_symbol_image_96 => $params->{election_symbol_image_96},
            });
        $c->stash(
            json => {
                success        => JSON::true(),
                status_message => 'Party Updated',
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

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched PoliticsDB::Site::Controller::Party in Party.');
}


=head1 AUTHOR

Shantanu Bhadoria,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
