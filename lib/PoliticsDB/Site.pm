package PoliticsDB::Site;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Log::Log4perl::Catalyst;

use PoliticsDB::Config;

use Catalyst qw/
    -Debug

    Session
    Session::Store::FastMmap
    Session::State::Cookie
    Authentication
    Authorization::Roles
/;

extends 'Catalyst';

our $VERSION = '0.01';

# Set logger object in Catalyst

__PACKAGE__->log(
    Log::Log4perl::Catalyst->new(PoliticsDB::Config->get('log_conf_file'))
);

# Configure the application.
#
# Note that settings in politicsdb_site.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'PoliticsDB::Site',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header

    'View::JSON' => {
        expose_stash => 'json'
    },

    'Plugin::Authentication' => {
        default => {
            class                     => 'SimpleDB',
            user_model                => 'DBIC::User',
            role_relation             => 'roles',
            role_field                => 'name',
            use_userdata_from_session => '1',
            password_type             => 'self_check',
        },
    },
);

# Start the application
__PACKAGE__->setup();


=head1 NAME

PoliticsDB::Site - Catalyst based application

=head1 SYNOPSIS

    script/politicsdb_site_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<PoliticsDB::Site::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Shantanu Bhadoria,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
