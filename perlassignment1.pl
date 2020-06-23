use strict;
use warnings;
use 5.010;
use Data::Dumper qw(Dumper);
use Getopt::Long qw(GetOptions);

my $product;
my $feature;
my $from;
GetOptions('product=s'=>\$product,
			'feature=s'=>\$feature,
			'from=s'=>\$from);
			
if(defined $from)
{
	gethash();
	if(defined $product)
	{
		getfeature($product);
	}
	elsif(defined $feature)
	{
		getproduct($feature);
	}
}
else
{
	print "Couldnt find options\n";
}

my %hash=();

sub gethash{
	my $filename = $from;
	open(FILE, '<:encoding(UTF-8)',$filename)
		or die "Could not open the file:$!\n";
	my $feature;
	while(my $line=<FILE>)
	{	
		chomp $line;
		 my @productpattern=$line=~m/product=[a-zA-Z0-9-]+/g;	
		 my @featurepattern=$line=~/\b^INCREMENT\s[a-zA-Z0-9]*\b/g;
		 foreach my $s (@featurepattern)
		{
			my @finalfeaturearray = split(/\s+/,$s);
			next if ($finalfeaturearray[1] eq "");
			$hash{$finalfeaturearray[1]} = () unless (defined $hash{$finalfeaturearray[1]});
			$feature = $finalfeaturearray[1];
		}
			
		foreach my $p (@productpattern)
		{
			my @finalproductarray;
			@finalproductarray = split(/=+/,$p);
			push @{$hash{$feature}},$finalproductarray[1]  unless ($feature eq '');
		}
	}
	close FILE;
	return Dumper(\%hash);	
}

sub getproduct
{
	print "Getting product\n";
	my $inputfeature= shift;
	print "The feature parameter is:".$inputfeature."\n";
	my @keys= keys %hash;
	foreach my $k (@keys)
	{
		if ($k eq $inputfeature)
		{
			print "The product with given feature is:",@{$hash{$k}},"\n";
		}
		else
		{
			print "Please check if the given product is appropriate\n";
			exit;
		}
	}
	return;
}

sub getfeature
{
	print "Getting feature\n";
	my $inputproduct=shift;
	print "The product parameter is:",$inputproduct,"\n";
	while(my ($key,$value)= each %hash)
	{
		my @values=@{$value};
		foreach my $x (@values)
		{
			if($x eq $inputproduct)
			{
				print "The feature of the given product is:",$key,"\n";
			}
			else
			{
				print "Please check if the given feature is appropriate\n";
				exit;
			}
		}
	}
return;
}
