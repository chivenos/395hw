#!/usr/bin/perl
use strict;
use warnings;

while (1) {
    print "x + y veya çıkış için 'exit' yazın:\n";
    my $input = <STDIN>;
    chomp($input);
    
    last if $input eq "exit";

    my @tokens = split(' ', $input);
    if (scalar(@tokens) != 3) {
        print "Hata!\n";
        next;
    }

    my ($left, $op, $right) = @tokens;

    if ($left !~ /^-?\d+(\.\d+)?$/ || $right !~ /^-?\d+(\.\d+)?$/) {
        print "Hata!\n";
        next;
    }

    $left += 0;
    $right += 0;

    my $result;
    if ($op eq "+") { $result = $left + $right; }
    elsif ($op eq "-") { $result = $left - $right; }
    elsif ($op eq "*") { $result = $left * $right; }
    elsif ($op eq "/") {
        if ($right == 0) { print "0'a bölünemez!\n"; next; }
        $result = $left / $right;
    } else {
        print "Hata!\n";
        next;
    }

    print "$result\n";
}
