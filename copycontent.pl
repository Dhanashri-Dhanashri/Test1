#!/usr/bin/perl

#open file to read
open(DATA1, "<data.txt");
#open file to write
open(DATA2, ">new.txt");

#writing contents
while(<DATA1>)
{
	print DATA2 $_;
}

close DATA1;
close DATA2;
