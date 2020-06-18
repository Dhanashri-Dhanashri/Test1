#!/usr/bin/perl
#use strict;
use warnings;
use Data::Dumper qw(Dumper);

$filename = "/home/dhanashri/Test1/file1.txt";
open(FILE, '<:encoding(UTF-8)',$filename)
	or die "Could not open the file:$!\n";
#my (@another, @string);
#my @prod;
#my @feat;
my %hash=();
my $feature;
while($line=<FILE>)
{	
	chomp $line;
	
	 @product=$line=~m/product=[a-zA-Z0-9-]+/g;	
	 @feature=$line=~/\b^INCREMENT\s[a-zA-Z0-9]*\b/g;
	 foreach $s (@feature)
	{
		@final = split(/\s+/,$s);
		print "\nfeature = *".$final[1]."*\n";
		#push @feat,$final[1];
		next if ($final[1] eq "");
		$hash{$final[1]} = () unless (defined $hash{$final[1]});
		$feature = $final[1];
	}
	
foreach $an (@product)
	{
		my @final_product;
		@final_product = split(/=+/,$an);
		print "\nprod=*".$final_product[1]."*\n";
	#push @prod,$final_product[1];
	push @{$hash{$feature}},$final_product[1]  unless ($feature eq '');
	}
	
}
close FILE;
print Dumper(\%hash);

