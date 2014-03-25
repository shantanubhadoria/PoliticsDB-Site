package PoliticsDB::Schema::Result::State;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "PassphraseColumn", "Validation");

=head1 NAME

PoliticsDB::Schema::Result::State

=cut

__PACKAGE__->table("states");

=head1 ACCESSORS

=head2 state_code

  data_type: 'varchar'
  is_nullable: 0
  size: 2

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
  "state_code",
  { data_type => "varchar", is_nullable => 0, size => 2 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);
__PACKAGE__->set_primary_key("state_code");

=head1 RELATIONS

=head2 loksabha_constituencies

Type: has_many

Related object: L<PoliticsDB::Schema::Result::LoksabhaConstituency>

=cut

__PACKAGE__->has_many(
  "loksabha_constituencies",
  "PoliticsDB::Schema::Result::LoksabhaConstituency",
  { "foreign.state_code" => "self.state_code" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 state_political_parties_maps

Type: has_many

Related object: L<PoliticsDB::Schema::Result::StatePoliticalPartiesMap>

=cut

__PACKAGE__->has_many(
  "state_political_parties_maps",
  "PoliticsDB::Schema::Result::StatePoliticalPartiesMap",
  { "foreign.state_code" => "self.state_code" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2014-03-17 21:08:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+70dANo5boVw4yYDU9iERQ

__PACKAGE__->resultset_class( 'DBIx::Class::ResultSet::HashRef' );

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
