#!/usr/bin/perl

$filename = "/home/dhanashri/Test1/file1.txt";
open($fh, '<:encoding(UTF-8)',$filename)
	or die "Could not open file '$filename' $!";
while($row = <$fh>)
{
	chomp $row;
	print "$row\n";
	if($row=~m/^INCREMENT/)
	{
		print "matched\n";
		@words = split / /,$row;
		print "@words[1]\n";
	}
}
close $fh;
