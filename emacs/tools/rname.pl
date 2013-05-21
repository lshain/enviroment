#!/usr/bin/perl
use strict;
use warnings;

foreach my $file (@ARGV) {
    (my $new_name = $file) =~ s/ /_/g;
    rename $file, $new_name;
}

