#!/usr/bin/perl
$scalar = <STDIN>;
$result1 = chomp($scalar);
$result2 = chop($scalar);
$result3 = defined($result2);
undef $scalar;
print "$scalar,$result1,$result2,$result3\n";
