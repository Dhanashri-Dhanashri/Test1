#!/usr/bin/perl
#Hash function for converting digit to string
sub convert
{
	my %words_for_digits;
	%words_for_digits= (0=>"zero",
						1=>"one",
						2=>"two",
						3=>"three",
						4=>"four",
						5=>"five",
						6=>"six",
						7=>"seven",
						8=>"eight",
						9=>"nine");
	@digits = keys %words_for_digits;
	foreach $digit (@digits)
	{
		foreach $string1 (@_)
		{
			if($digit==$string1)
		{
			print "$words_for_digits{'$digit'}\n";
		}
	}
	}
}
$string=<STDIN>;
@result = &convert($string);
print "@result\n";
