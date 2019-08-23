package Data::Transmute::Rules::DNS::Zone::Struct::FromSpanel;

# DATE
# VERSION

use strict;
use warnings;

our @RULES = (
    [transmute_hash_values => {
        key_is => 'records',
        rules => [
            [transmute_array_elems => {
                rules => [
                    [rename_hash_key => {from=>'owner', to=>'name'}],
                ],
            }],
            [transmute_array_elems => {
                index_filter => sub { my %args=@_; my $data = $args{array}->[ $args{index} ]; $data->{type} eq 'MX' },
                rules => [
                    [rename_hash_key => {from=>'pref', to=>'priority'}],
                ],
            }],
        ],
    }],
);

1;
# ABSTRACT: Convert Spanel DNS zone structure to that accepted by DNS::Zone::Struct::To::BIND (Sah::Schema::dns::zone)
