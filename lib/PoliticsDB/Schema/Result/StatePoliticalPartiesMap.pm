package PoliticsDB::Schema::Result::StatePoliticalPartiesMap;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "PassphraseColumn", "Validation");

=head1 NAME

PoliticsDB::Schema::Result::StatePoliticalPartiesMap

=cut

__PACKAGE__->table("state_political_parties_maps");

=head1 ACCESSORS

=head2 political_party_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 state_code

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 2

=cut

__PACKAGE__->add_columns(
  "political_party_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "state_code",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 2 },
);
__PACKAGE__->set_primary_key("political_party_id", "state_code");

=head1 RELATIONS

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

=head2 state_code

Type: belongs_to

Related object: L<PoliticsDB::Schema::Result::State>

=cut

__PACKAGE__->belongs_to(
  "state_code",
  "PoliticsDB::Schema::Result::State",
  { state_code => "state_code" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2014-03-17 21:08:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3dv/hZZOwc5S7mJyRTSB1A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
