use strict;
use warnings;
use Test::More;


use Catalyst::Test 'PoliticsDB::Site';
use PoliticsDB::Site::Controller::State;

ok( request('/state')->is_success, 'Request should succeed' );
done_testing();
