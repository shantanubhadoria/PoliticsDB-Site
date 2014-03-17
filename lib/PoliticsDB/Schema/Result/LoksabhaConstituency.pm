package PoliticsDB::Schema::Result::LoksabhaConstituency;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "PassphraseColumn", "Validation");

=head1 NAME

PoliticsDB::Schema::Result::LoksabhaConstituency

=cut

__PACKAGE__->table("loksabha_constituencies");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 state_code

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 1
  size: 2

=head2 is_union_territory

  data_type: 'tinyint'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "state_code",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 1, size => 2 },
  "is_union_territory",
  { data_type => "tinyint", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 state_code

Type: belongs_to

Related object: L<PoliticsDB::Schema::Result::State>

=cut

__PACKAGE__->belongs_to(
  "state_code",
  "PoliticsDB::Schema::Result::State",
  { state_code => "state_code" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 loksabha_constituencies_candidate_maps

Type: has_many

Related object: L<PoliticsDB::Schema::Result::LoksabhaConstituenciesCandidateMap>

=cut

__PACKAGE__->has_many(
  "loksabha_constituencies_candidate_maps",
  "PoliticsDB::Schema::Result::LoksabhaConstituenciesCandidateMap",
  { "foreign.loksabha_constituency_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2014-03-17 21:08:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:i67ZqRpUQtwAyM1YtteyIg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
