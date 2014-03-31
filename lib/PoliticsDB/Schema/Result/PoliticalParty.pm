package PoliticsDB::Schema::Result::PoliticalParty;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "PassphraseColumn", "Validation");

=head1 NAME

PoliticsDB::Schema::Result::PoliticalParty

=cut

__PACKAGE__->table("political_parties");

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

=head2 election_symbol

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 election_symbol_image_96

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 type_of_party

  data_type: 'enum'
  extra: {list => ["national","state","registered_unrecognized"]}
  is_nullable: 0

=head2 founding_year

  data_type: 'year'
  is_nullable: 1

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
  "election_symbol",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "election_symbol_image_96",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "type_of_party",
  {
    data_type => "enum",
    extra => { list => ["national", "state", "registered_unrecognized"] },
    is_nullable => 0,
  },
  "founding_year",
  { data_type => "year", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("name_UNIQUE", ["name"]);

=head1 RELATIONS

=head2 loksabha_constituencies_candidate_maps

Type: has_many

Related object: L<PoliticsDB::Schema::Result::LoksabhaConstituenciesCandidateMap>

=cut

__PACKAGE__->has_many(
  "loksabha_constituencies_candidate_maps",
  "PoliticsDB::Schema::Result::LoksabhaConstituenciesCandidateMap",
  { "foreign.political_party_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 state_political_parties_maps

Type: has_many

Related object: L<PoliticsDB::Schema::Result::StatePoliticalPartiesMap>

=cut

__PACKAGE__->has_many(
  "state_political_parties_maps",
  "PoliticsDB::Schema::Result::StatePoliticalPartiesMap",
  { "foreign.political_party_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2014-03-17 21:08:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:w+InoiSG7ZzGH1+pfHHjCQ

__PACKAGE__->resultset_class( 'DBIx::Class::ResultSet::HashRef' );

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
