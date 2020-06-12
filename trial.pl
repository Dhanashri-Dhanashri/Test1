#!/usr/bin/perl
use strict;
$filename = "try.txt";
open(fh,$filename)
	or die "Could not open the file $filename";
while(<fh>)
{
	$string=$_;
}
my $regex = qr/\/\*([\s\S]*?)\*\//p;
if($string=~/$regex/g)
{
	print $string;
}

close;
