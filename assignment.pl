#!/usr/bin/perl
use strict;
use warnings;

sub getProd{
my $filename = "/home/dhanashri/Test1/file1.txt";
open(FILE, '<:encoding(UTF-8)',$filename)
	or die "Could not open file '$filename' $!";

my $rows = <FILE>;
chomp @rows;
print "$row[0]\n";
my $feature = shift;
foreach $word (@rows)
{
	print "$word\n";
	if($word=~m/^(INCREMENT)\s$feature\s$/)
	{
		push @product,$word;
	}
}
print "@product\n";
close FILE;
}

my $product = getProd('MATLAB');
print "$product\n";
