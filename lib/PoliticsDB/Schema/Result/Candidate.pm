package PoliticsDB::Schema::Result::Candidate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "PassphraseColumn", "Validation");

=head1 NAME

PoliticsDB::Schema::Result::Candidate

=cut

__PACKAGE__->table("candidates");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 first_name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 middle_name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 last_name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 political_party_id

  data_type: 'integer'
  extra: {unsigned => 1}
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
  "first_name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "middle_name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "last_name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "political_party_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 loksabha_constituencies_candidate_maps

Type: has_many

Related object: L<PoliticsDB::Schema::Result::LoksabhaConstituenciesCandidateMap>

=cut

__PACKAGE__->has_many(
  "loksabha_constituencies_candidate_maps",
  "PoliticsDB::Schema::Result::LoksabhaConstituenciesCandidateMap",
  { "foreign.candidate_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2014-03-17 21:08:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zF5tD56xdRqM0Vik/YDwLw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
