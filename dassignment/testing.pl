#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use Data::Dumper qw(Dumper);
use Getopt::Long qw(GetOptions);

my %hash=();
my $product;
my $feature;
my $from;
my $p2f;
my $f2p;
my $output;
main();

sub main{
	GetOptions('product=s'=>\$product,
			'feature=s'=>\$feature,
			'p2f'=>\$p2f,
			'f2p'=>\$f2p,
			'from=s'=>\$from,
			'output=s'=>\$output);
			
	if(defined $from)
	{
		generatehash();
		if(defined $product)
		{
			getfeature($product);
		}
		elsif(defined $feature)
		{
			getproduct($feature);
		}
		elsif(defined $p2f)
		{
			producttofeature();
		}
		elsif(defined $f2p)
		{
			featuretoproduct();
		}
	}
	else
	{
		print "Usage: $0 --product PRODUCTNAME|--feature FEATURENAME --from SOURCE --output DESTINATION\n";
	}
}

sub generatehash{
	my $filename = $from;
	open(FILE, '<:encoding(UTF-8)',$filename)
		or die "Could not open the file:$!\n";
	my $feature;
	while(my $line=<FILE>)
	{	next if ($line=~/#.*/);
		chomp $line;
		 my @productpattern=$line=~m/="*product=([a-zA-Z0-9\s_[\]-]+)"*?\s/g;	
		 my @featurepattern=$line=~/\b^INCREMENT\s(.+)\s[MLM]+\b/g;
		 foreach my $s (@featurepattern)
		{ 
			next if ($s eq "");
			$hash{$s} = () unless (defined $hash{$s});
			$feature = $s;
		}	
		foreach my $p (@productpattern)
		{	
			my @finalproductarray;
			push @{$hash{$feature}},$p  if (defined $feature && (!($feature eq '')));
		}
	}
	close FILE;	
	return \%hash;	
}

sub getproduct
{
	print "Getting product\n";
	my $inputfeature= shift;
	print "The feature parameter is:".$inputfeature."\n";
	my @keys= keys %hash;
	foreach my $k (@keys)
	{
		if($k eq $inputfeature)
		{
			print "The product with given feature is:".@{$hash{$k}}."\n";
			print "Successfully saved in $output as feature,product pair\n" if(defined $output);
			if(defined $output)
			{
				my $outputfile = $output;
				open(OUT, '>',$outputfile)
				or die "Could not open the file:$!\n";
				print OUT "This contains the list of Feature and Product\n";
				print OUT $inputfeature.",".@{$hash{$k}}."\n";
				close OUT;
			}
		}
	}
	return;
}


sub getfeature
{
	print "Getting feature\n";
	my $inputproduct=shift;
	print "The product parameter is:".$inputproduct."\n";
	while(my ($key,$value)= each %hash)
	{	
		next unless (defined $value);
		my @values=@{$value};
		foreach my $x (@values)
		{
			next unless (defined $x);
			if($x eq $inputproduct)
			{
		
				print "The feature of the given product is:".$key."\n";
				print "Successfully saved in $output as product,feature pairs\n" if(defined $output);
				if(defined $output)
				{
					my $outputfile = $output;
					open(OUT, '>',$outputfile)
					or die "Could not open the file:$!\n";
					print OUT "This contains the list of Product and Feature\n";
					print OUT $inputproduct.",".$key."\n";
					close OUT;
				}
			}
		}
	}
return;
}

sub producttofeature
{
	my $output_string = "";
	my $outputfile = $output;
	while(my ($key,$value)= each %hash)
	{	
		next unless (defined $value);
		my @values=@{$value};
		foreach my $x (@values)
		{
			print $key,",",$x,"\n";
		}
		if(defined $output)
			{
				foreach my $x (@values)
				{
					$output_string.= $x.",".$key."\n";
				}
				close OUT;
			}
	}
	if ($output_string ne "")
	{
		open(OUT, '>',$outputfile) or die "Could not open the file:$!\n";
		print OUT "$output_string";
		close OUT;
	}
}

sub featuretoproduct
{	
	my $output_string = "";
	my $outputfile = $output;
	while(my ($key,$value)= each %hash)
	{
		next unless (defined $value);
		my @values=@{$value};
		foreach my $x (@values)
		{
			print $key,",",$x,"\n";
		}
		if(defined $output)
			{
				foreach my $x (@values)
				{
					$output_string.= $key.",".$x."\n";
				}
			}
	}
	if ($output_string ne "")
	{
		open(OUT, '>',$outputfile) or die "Could not open the file:$!\n";
		print OUT "$output_string";
		close OUT;
	}
}

