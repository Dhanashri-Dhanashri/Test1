#use strict;
use warnings;
use 5.010;
use Data::Dumper qw(Dumper);
use Getopt::Long qw(GetOptions);

GetOptions('product=s'=>\$product,
			'feature=s'=>\$feature,
			'filepath=s'=>\$filepath);
if(defined $filepath){
	gethash();
	if(defined $product)
	{
		getfeature($product);
	}
	elsif(defined $feature)
	{
		getprod($feature);
	}
}
else{print "Couldnt find options\n";}

my %hash=();
#subroutine to get hash
sub gethash{
		$filename = $filepath;
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
	print "Getting product\n";
	my $featparam= shift;
	print "The feature parameter is:".$featparam."\n";
	my @keys= keys %hash;
	foreach $k (@keys)
	{
		if ($k eq $featparam)
		{
			print "The product with given feature is:",@{$hash{$k}},"\n";
		}
	}
	return;
}

#subroutine to get feature from product
sub getfeature
{
	print "Getting feature\n";
	my $prodparam=shift;
	print "The product parameter is:",$prodparam,"\n";
	while(($key,$value)= each %hash)
	{
		@vale=@{$value};
		foreach $x (@{vale})
		{
			if($x eq $prodparam)
			{
				print "The feature of the given product is:",$key,"\n";
			}
		}
	}
return;
}
