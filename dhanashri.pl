#!/usr/bin/perl
#use strict;
use warnings;
use Data::Dumper qw(Dumper);

#getprod(SIMULINK);
#getfeature('MATLAB-pp2');
display();
my %hash=();
#subroutine to get hash
sub gethash{
		$filename = "/home/dhanashri/Test1/file1.txt";
		open(FILE, '<:encoding(UTF-8)',$filename)
			or die "Could not open the file:$!\n";
		my $feature;
		while($line=<FILE>)
		{	
			chomp $line;
			
			 @product=$line=~m/product=[a-zA-Z0-9-]+/g;	
			 @feature=$line=~/\b^INCREMENT\s[a-zA-Z0-9]*\b/g;
			 foreach $s (@feature)
			{
				@final = split(/\s+/,$s);
				next if ($final[1] eq "");
				$hash{$final[1]} = () unless (defined $hash{$final[1]});
				$feature = $final[1];
			}
			
		foreach $an (@product)
			{
				my @final_product;
				@final_product = split(/=+/,$an);
			push @{$hash{$feature}},$final_product[1]  unless ($feature eq '');
			}
		}
		close FILE;
	return Dumper(\%hash);
}

#subroutine to get product from feature	
sub getprod
{
	my $featparam= shift;
	print "The feature parameter is:".$featparam."\n";
	gethash();
	my @keys= keys %hash;
	foreach $k (@keys)
	{
		print "The products are:",@{$hash{$k}},"\n" if ($k eq $featparam);
	}
	return;
}

#subroutine to get feature from product
sub getfeature
{
	my $prodparam=shift;
	print "The product parameter is:",$prodparam,"\n";
	gethash();
	while(($key,$value)= each %hash)
	{
		@vale=@{$value};
		foreach $x (@{vale})
		{
			if($x eq $prodparam)
			{
				print "The feature is:",$key,"\n";
			}
		}
	}
return;
}

sub display
{
	gethash();
	while(($key,$value)= each %hash)
	{
		print "$key".":"."@{$value}"."\n";
	}
return;
}
