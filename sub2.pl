#!/usr/bin/perl

sub area
{
	my ($width, $height) = @_;
#	my $width= shift;
#	my $height= shift;
	return $width * $height;
}
$area = area(10,5);
print "The area is $area\n";
