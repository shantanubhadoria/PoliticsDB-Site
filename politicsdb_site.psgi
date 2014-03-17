use strict;
use warnings;

use PoliticsDB::Site;

my $app = PoliticsDB::Site->apply_default_middlewares(PoliticsDB::Site->psgi_app);
$app;

