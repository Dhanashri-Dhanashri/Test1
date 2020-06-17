#!/usr/bin/perl

sub volume{
	my ($height,$width,$length) = @_;
	return $height*$width*$length;
}

my $vol = volume(1,2,4);
print "\nResulting volume: $vol\n";
