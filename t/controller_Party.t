use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'PoliticsDB::Site' }
BEGIN { use_ok 'PoliticsDB::Site::Controller::Party' }

ok( request('/party')->is_success, 'Request should succeed' );


