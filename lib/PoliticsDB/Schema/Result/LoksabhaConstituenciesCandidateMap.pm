package PoliticsDB::Schema::Result::LoksabhaConstituenciesCandidateMap;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "PassphraseColumn", "Validation");

=head1 NAME

PoliticsDB::Schema::Result::LoksabhaConstituenciesCandidateMap

=cut

__PACKAGE__->table("loksabha_constituencies_candidate_maps");

=head1 ACCESSORS

=head2 candidate_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 loksabha_constituency_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 year

  data_type: 'year'
  is_nullable: 0

=head2 political_party_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "candidate_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "loksabha_constituency_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "year",
  { data_type => "year", is_nullable => 0 },
  "political_party_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);
__PACKAGE__->set_primary_key("candidate_id", "loksabha_constituency_id", "year");

=head1 RELATIONS

=head2 candidate

Type: belongs_to

Related object: L<PoliticsDB::Schema::Result::Candidate>

=cut

__PACKAGE__->belongs_to(
  "candidate",
  "PoliticsDB::Schema::Result::Candidate",
  { id => "candidate_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 loksabha_constituency

Type: belongs_to

Related object: L<PoliticsDB::Schema::Result::LoksabhaConstituency>

=cut

__PACKAGE__->belongs_to(
  "loksabha_constituency",
  "PoliticsDB::Schema::Result::LoksabhaConstituency",
  { id => "loksabha_constituency_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 political_party

Type: belongs_to

Related object: L<PoliticsDB::Schema::Result::PoliticalParty>

=cut

__PACKAGE__->belongs_to(
  "political_party",
  "PoliticsDB::Schema::Result::PoliticalParty",
  { id => "political_party_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2014-03-17 21:08:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1r9d01pEtousWZ4VSbJR+Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
